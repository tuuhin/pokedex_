import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/util/string_helper.dart';
import '../../core/util/paginator/paginator.dart';
import '../../core/models/base_response_model.dart';
import '../domain/models/pokemon_ability_model.dart';
import '../domain/repository/pokemon_ability_repository.dart';

class PokemonAbilityNotifier
    extends StateNotifier<Paginator<List<PokemonAbility>>> {
  PokemonAbilityNotifier(this._repository) : super(Paginator.loading());

  final PokemonAbilityRespository _repository;

  final GlobalKey<SliverAnimatedListState> _key =
      GlobalKey<SliverAnimatedListState>();

  final List<PokemonAbility> _ability = [];

  GlobalKey<SliverAnimatedListState> get key => _key;

  int _offset = 0;

  String? _nextURL;

  int get abilityCount => _ability.length;

  Timer _limiter = Timer(const Duration(seconds: 2), () {});

  void init() => _ability.isEmpty ? _fetchSomeAbility() : _fetchMoreAbility();

  void fetchMore() => _fetchMoreAbility();

  void refresh() => _fetchSomeAbility();

  void _fetchSomeAbility() async {
    try {
      PokemonBaseResponse base = await _repository.getAbility(offset: _offset);

      _nextURL = base.next;

      List<PokemonAbility> abilities =
          await _repository.getDetailedAbility(base.results);

      if (_nextURL != null) {
        _offset = getOffsetFromString(_nextURL!) ?? 1;
      }

      state = Paginator.data(_ability..addAll(abilities));

      for (final PokemonAbility ability in abilities) {
        await Future.delayed(
          const Duration(milliseconds: 400),
          () => _key.currentState?.insertItem(_ability.indexOf(ability)),
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

      PokemonBaseResponse base =
          await _repository.getAbility(offset: _offset, limit: 5);

      _nextURL = base.next;
      List<PokemonAbility> abilities =
          await _repository.getDetailedAbility(base.results);

      if (_nextURL != null) {
        _offset = getOffsetFromString(_nextURL!) ?? _offset;
      }

      state = Paginator.data(_ability..addAll(abilities));

      for (final PokemonAbility ab in abilities) {
        await Future.delayed(
          const Duration(milliseconds: 400),
          () => _key.currentState?.insertItem(_ability.indexOf(ab)),
        );
      }
    } catch (e, stk) {
      debugPrintStack(stackTrace: stk);
      state = Paginator.errorLoadMore(_ability, e, stk);
    }
  }
}
