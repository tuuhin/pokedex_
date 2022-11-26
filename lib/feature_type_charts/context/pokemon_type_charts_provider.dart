import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_pokedex/core/util/utlis.dart';
import 'package:flutter_pokedex/feature_type_charts/domain/repository/pokemon_type_chats_repo.dart';
import 'package:flutter_pokedex/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/base_response_model.dart';
import '../../core/util/paginator/paginator.dart';
import '../domain/models/models.dart';

class PokemonTypeChartsNotifier
    extends StateNotifier<Paginator<List<PokemonTypeDetailedModel>>> {
  final PokemonTypeChartsRepostiory _repo;
  PokemonTypeChartsNotifier(this._repo) : super(Paginator.loading());

  int _offset = 0;
  final List<PokemonTypeDetailedModel> _types = [];

  String? _nextURL;

  int get count => _types.length;

  final GlobalKey<SliverAnimatedListState> _key =
      GlobalKey<SliverAnimatedListState>();

  GlobalKey<SliverAnimatedListState> get listKey => _key;

  Timer _timer = Timer(const Duration(milliseconds: 1000), () {});

  void init() => _types.isEmpty ? _fetchTypes() : _fetchMoreTypes();

  void requestMore() => _fetchMoreTypes();

  void _fetchTypes() async {
    try {
      PokemonBaseResponse response = await _repo.getBaseTypeInfo();
      if (response.next != null) {
        _offset = getIdFromString(response.next!);
      }
      List<PokemonTypeDetailedModel> types =
          await _repo.getTypeDetailed(response.results);
      state = Paginator.data(_types..addAll(types));
      logger.fine(_types.first);
      for (final PokemonTypeDetailedModel type in types) {
        await Future.delayed(
          const Duration(milliseconds: 300),
          () => _key.currentState?.insertItem(
            types.indexOf(type),
          ),
        );
      }
    } catch (e, stk) {
      logger.shout("error");
      state = Paginator.error(e, stk);
    }
  }

  void _fetchMoreTypes() async {
    try {
      logger.fine("ticked");
      if (_nextURL == null) {
        state = Paginator.end("No more types", _types);
        return;
      }
      logger.fine("not ticked");
      if (_timer.isActive) return;
      _timer = Timer(const Duration(milliseconds: 1000), () {});

      state = Paginator.loadMore(_types);

      PokemonBaseResponse response =
          await _repo.getBaseTypeInfo(offset: _offset);
      if (response.next != null) {
        _offset = getIdFromString(response.next!);
      }
      List<PokemonTypeDetailedModel> types =
          await _repo.getTypeDetailed(response.results);
      state = Paginator.data(_types..addAll(types));
      logger.fine(_types.first);
      for (final PokemonTypeDetailedModel type in types) {
        await Future.delayed(
          const Duration(milliseconds: 300),
          () => _key.currentState?.insertItem(
            types.indexOf(type),
          ),
        );
      }
    } catch (e, stk) {
      state = Paginator.errorLoadMore(_types, e, stk);
    }
  }
}
