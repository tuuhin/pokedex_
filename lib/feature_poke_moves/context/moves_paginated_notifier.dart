import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/base_response_model.dart';
import '../../core/util/paginator/paginator.dart';
import '../../core/util/utlis.dart';
import '../domain/domain.dart';

class PokemonMovesPaginatedNotifier
    extends StateNotifier<Paginator<List<PokemonMoveDetailed>>> {
  PokemonMovesPaginatedNotifier(this._repository) : super(Paginator.loading());
  final PokemonMoveRespository _repository;

  final List<PokemonMoveDetailed> _moves = <PokemonMoveDetailed>[];
  final GlobalKey<SliverAnimatedListState> _stateKey =
      GlobalKey<SliverAnimatedListState>();

  GlobalKey<SliverAnimatedListState> get key => _stateKey;

  int get moveCount => _moves.length;

  Timer _limiter = Timer(const Duration(seconds: 2), () {});

  String? _nextURL;
  int _offset = 0;

  void refresh() => _fetchSomeMoves();

  void init() => _moves.isEmpty ? _fetchSomeMoves() : _fetchMoreMoves();

  void requestMore() => _fetchMoreMoves();

  void _fetchSomeMoves() async {
    try {
      PokemonBaseResponse move = await _repository.getMoves(limit: 5);
      _nextURL = move.next;
      if (_nextURL != null) {
        _offset = getOffsetFromString(_nextURL!) ?? 0;
      }

      List<PokemonMoveDetailed> movesDetailed =
          await _repository.getDetailedMove(move.results);

      state = Paginator.data(_moves..addAll(movesDetailed));

      for (final PokemonMoveDetailed move in movesDetailed) {
        await Future.delayed(
          const Duration(milliseconds: 200),
          () => _stateKey.currentState?.insertItem(_moves.indexOf(move)),
        );
      }
    } catch (e, stk) {
      debugPrintStack(stackTrace: stk);
      state = Paginator.error(e, stk);
    }
  }

  void _fetchMoreMoves() async {
    if (_nextURL == null) {
      state = Paginator.end("The end", _moves);
      return;
    }
    if (_limiter.isActive) return;

    _limiter = Timer(const Duration(seconds: 2), () {});
    try {
      state = Paginator.loadMore(_moves);
      PokemonBaseResponse move =
          await _repository.getMoves(offset: _offset, limit: 5);

      _nextURL = move.next;

      List<PokemonMoveDetailed> movesDetailed =
          await _repository.getDetailedMove(move.results);

      if (_nextURL != null) {
        _offset = getOffsetFromString(_nextURL!) ?? _offset;
      }

      state = Paginator.data(_moves..addAll(movesDetailed));

      for (final PokemonMoveDetailed move in movesDetailed) {
        await Future.delayed(
          const Duration(milliseconds: 200),
          () => _stateKey.currentState?.insertItem(_moves.indexOf(move)),
        );
      }
    } catch (e, stk) {
      state = Paginator.errorLoadMore(_moves, e, stk);
      debugPrintStack(stackTrace: stk);
    }
  }
}
