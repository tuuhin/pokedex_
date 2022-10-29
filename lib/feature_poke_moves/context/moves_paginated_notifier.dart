import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_pokedex/core/util/string_helper.dart';
import 'package:flutter_pokedex/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/base_response_model.dart';
import '../../core/util/paginator/paginator.dart';
import '../domain/domain.dart';

class PokemonMovesPaginatedNotifier
    extends StateNotifier<Paginator<List<PokemonMoveDetailed>>> {
  PokemonMovesPaginatedNotifier(this._impl) : super(Paginator.loading());
  final PokemonMoveRespository _impl;

  final List<PokemonMoveDetailed> _moves = <PokemonMoveDetailed>[];
  final GlobalKey<SliverAnimatedListState> _stateKey =
      GlobalKey<SliverAnimatedListState>();

  GlobalKey<SliverAnimatedListState> get key => _stateKey;

  int get moveCount => _moves.length;

  Timer _limiter = Timer(const Duration(seconds: 2), () {});

  String? _nextURL;
  int _offset = 0;

  void init() => _moves.isEmpty ? _fetchSomeMoves() : _fetchMoreMoves();

  void requestMore() => _fetchMoreMoves();

  void _fetchSomeMoves() async {
    try {
      PokemonBaseResponse move = await _impl.getMoves(limit: 5);
      _nextURL = move.next;
      if (_nextURL != null) {
        _offset = getOffsetFromString(_nextURL!) ?? 0;
      }

      List<PokemonMoveDetailed> movesDetailed =
          await _impl.getDetailedMove(move.results);

      state = Paginator.data(_moves..addAll(movesDetailed));

      for (final PokemonMoveDetailed move in movesDetailed) {
        await Future.delayed(const Duration(milliseconds: 600), () {
          logger.fine("message adding ${_moves.indexOf(move)}");
          _stateKey.currentState?.insertItem(_moves.indexOf(move));
        });
      }
    } on DioError catch (dio, stk) {
      logger.shout(dio);
      Paginator.error(dio, stk);
    } catch (e, stk) {
      logger.shout(e);
      Paginator.error(e, stk);
    }
  }

  void _fetchMoreMoves() async {
    if (_nextURL == null) {
      state = Paginator.end("The end", _moves);
      return;
    }
    if (_limiter.isActive) return;
    logger.shout("Requesting PokemonNews  move offset:$_offset ");
    _limiter = Timer(const Duration(seconds: 2), () {});
    try {
      state = Paginator.loadMore(_moves);
      PokemonBaseResponse move =
          await _impl.getMoves(offset: _offset, limit: 10);
      _nextURL = move.next;
      if (_nextURL != null) {
        _offset = getOffsetFromString(_nextURL!) ?? _offset;
      }
      List<PokemonMoveDetailed> movesDetailed =
          await _impl.getDetailedMove(move.results);
      state = Paginator.data(_moves..addAll(movesDetailed));
      if (_stateKey.currentState != null) {
        for (final PokemonMoveDetailed move in movesDetailed) {
          logger.fine("adding ${_moves.indexOf(move)}");
          _stateKey.currentState?.insertItem(_moves.indexOf(move));
        }
      }
    } catch (e, stk) {
      state = Paginator.errorLoadMore(_moves, e, stk);
    }
  }
}
