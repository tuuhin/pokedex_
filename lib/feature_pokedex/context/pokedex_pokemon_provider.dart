import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/base_response_model.dart';
import '../../core/util/paginator/paginator.dart';
import '../../core/util/string_helper.dart';
import '../../main.dart';
import '../domain/models/pokedex_model.dart';
import '../domain/repository/pokedex_pokemon_repo.dart';

class PokedexPokemonNotifier
    extends StateNotifier<Paginator<List<PokedexPokemonModel>>> {
  PokedexPokemonNotifier(this._repository) : super(Paginator.loading());

  final PokedexPokemonRepository _repository;

  final List<PokedexPokemonModel> _pokemons = [];

  List<PokedexPokemonModel> get pokemons => _pokemons;

  final GlobalKey<SliverAnimatedListState> _stateKey =
      GlobalKey<SliverAnimatedListState>();

  int _offset = 0;

  String? _nextURL;

  Timer _timer = Timer(const Duration(milliseconds: 2000), () {});

  void init() => _pokemons.isEmpty ? _fetchSome() : _fetchMore();

  void requestMore() => _fetchMore();

  void refresh() {
    state = Paginator.loading();
    _fetchSome();
  }

  void _fetchSome() async {
    try {
      PokemonBaseResponse response =
          await _repository.getPokemons(offset: _offset, limit: 20);
      _nextURL = response.next;
      if (_nextURL != null) {
        _offset = getOffsetFromString(_nextURL!) ?? 0;
      }

      List<PokedexPokemonModel> pokemons =
          await _repository.getPokemonInfo(response.results);

      pokemons.removeWhere((element) => element.isDefault == false);

      state = Paginator.data(_pokemons..addAll(pokemons));

      for (final PokedexPokemonModel pokemon in pokemons) {
        await Future.delayed(
          const Duration(milliseconds: 600),
          () => _stateKey.currentState?.insertItem(
            _pokemons.indexOf(pokemon),
          ),
        );
      }
    } on DioError catch (dio, stk) {
      logger.shout(dio);
      state = Paginator.error(dio, stk);
    } catch (e, stk) {
      debugPrintStack(stackTrace: stk);
      logger.shout(e);
      state = Paginator.error(e, stk);
    }
  }

  void _fetchMore() async {
    if (state == Paginator.loading()) {
      return;
    }
    if (_nextURL == null) {
      state = Paginator.end("ENd of the list", _pokemons);
      return;
    }
    if (_timer.isActive) return;
    state = Paginator.loadMore(_pokemons);
    _timer = Timer(const Duration(milliseconds: 2000), () {});
    try {
      PokemonBaseResponse response =
          await _repository.getPokemons(offset: _offset, limit: 10);
      _nextURL = response.next;

      List<PokedexPokemonModel> pokemons =
          await _repository.getPokemonInfo(response.results);

      if (_nextURL != null) {
        _offset = getOffsetFromString(_nextURL!) ?? _offset;
      }

      pokemons.removeWhere((element) => element.isDefault == false);

      state = Paginator.data(_pokemons..addAll(pokemons));

      for (final PokedexPokemonModel pokemon in pokemons) {
        await Future.delayed(
          const Duration(milliseconds: 600),
          () => _stateKey.currentState?.insertItem(
            _pokemons.indexOf(pokemon),
          ),
        );
      }
    } on DioError catch (dio, stk) {
      state = Paginator.errorLoadMore(_pokemons, dio, stk);
    } catch (e, stk) {
      debugPrintStack(stackTrace: stk);
      state = Paginator.errorLoadMore(_pokemons, e, stk);
    }
  }
}
