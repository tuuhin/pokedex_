import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_pokedex/core/util/paginator/paginator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/base_response_model.dart';
import '../../core/util/string_helper.dart';
import '../../main.dart';
import '../domain/models/pokemon_simplified_model.dart';
import '../domain/repository/pokemon_simplified_repo.dart';

class SimplifiedPokeDexNotifier
    extends StateNotifier<Paginator<List<PokedexPokemonSimplifiedModel>>> {
  SimplifiedPokeDexNotifier(this._repository) : super(Paginator.loading());

  final PokemonSimplifiedRepository _repository;

  final List<PokedexPokemonSimplifiedModel> _pokemons = [];

  final GlobalKey<SliverAnimatedListState> _stateKey =
      GlobalKey<SliverAnimatedListState>();

  int _offset = 0;

  String? _nextURL;

  Timer _timer = Timer(const Duration(milliseconds: 2000), () {});

  void init() => _pokemons.isEmpty ? _fetchSome() : _fetchMore();

  void _fetchSome() async {
    try {
      PokemonBaseResponse response = await _repository.getPokemons();
      _nextURL = response.next;
      if (_nextURL != null) {
        _offset = getOffsetFromString(_nextURL!) ?? 0;
      }

      List<PokedexPokemonSimplifiedModel> pokemons =
          await _repository.getSimplePokemonInfo(response.results);

      state = Paginator.data(_pokemons..addAll(pokemons));

      for (final PokedexPokemonSimplifiedModel pokemon in pokemons) {
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

  void _fetchMore() {
    if (_nextURL == null) {
      state = Paginator.end("ENd of the list", _pokemons);
      return;
    }
    if (_timer.isActive) return;
  }
}
