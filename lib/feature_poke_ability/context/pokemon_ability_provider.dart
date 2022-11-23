import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/base_response_model.dart';
import '../../core/util/paginator/paginator.dart';
import '../../core/util/string_helper.dart';
import '../domain/models/pokemon_ability_model.dart';
import '../domain/repository/pokemon_ability_repository.dart';

class PokemonAbilityNotifier
    extends StateNotifier<Paginator<List<PokemonAbility>>> {
  PokemonAbilityNotifier(this._pokemonAbilityRespository)
      : super(Paginator.loading());

  final PokemonAbilityRespository _pokemonAbilityRespository;

  final GlobalKey<SliverAnimatedListState> _key =
      GlobalKey<SliverAnimatedListState>();

  final List<PokemonAbility> _ability = [];

  GlobalKey<SliverAnimatedListState> get key => _key;

  int _offset = 300;

  String? _nextURL;

  int get abilityCount => _ability.length;

  Timer _limiter = Timer(const Duration(seconds: 2), () {});

  void init() => _ability.isEmpty ? _fetchSomeAbility() : _fetchMoreAbility();

  void fetchMore() => _fetchMoreAbility();

  void refresh() => _fetchSomeAbility();

  void _fetchSomeAbility() async {
    try {
      PokemonBaseResponse base = await _pokemonAbilityRespository.getAbility();
      _nextURL = base.next;
      if (_nextURL != null) {
        _offset = getOffsetFromString(_nextURL!) ?? 1;
      }
      List<PokemonAbility> abilities =
          await _pokemonAbilityRespository.getDetailedAbility(base.results);

      state = Paginator.data(_ability..addAll(abilities));

      for (final PokemonAbility ability in abilities) {
        await Future.delayed(
          const Duration(milliseconds: 400),
          () => _key.currentState?.insertItem(
            _ability.indexOf(ability),
          ),
        );
      }
    } catch (e, stk) {
      debugPrintStack(stackTrace: stk);
      state = Paginator.error(e, stk);
    }
  }

  void _fetchMoreAbility() async {
    if (_nextURL == null) {
      state = Paginator.end("The end", _ability);
      return;
    }
    if (_limiter.isActive) return;
    _limiter = Timer(const Duration(seconds: 2), () {});
    try {
      state = Paginator.loadMore(_ability);
      PokemonBaseResponse base = await _pokemonAbilityRespository.getAbility(
          offset: _offset, limit: 5);

      _nextURL = base.next;
      if (_nextURL != null) {
        _offset = getOffsetFromString(_nextURL!) ?? _offset;
      }

      List<PokemonAbility> abilities =
          await _pokemonAbilityRespository.getDetailedAbility(base.results);

      state = Paginator.data(_ability..addAll(abilities));

      for (final PokemonAbility ability in abilities) {
        await Future.delayed(
          const Duration(milliseconds: 400),
          () => _key.currentState?.insertItem(
            _ability.indexOf(ability),
          ),
        );
      }
    } catch (e, stk) {
      debugPrintStack(stackTrace: stk);
      state = Paginator.errorLoadMore(_ability, e, stk);
    }
  }
}
