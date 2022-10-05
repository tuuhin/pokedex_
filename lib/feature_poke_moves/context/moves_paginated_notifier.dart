import 'package:dio/dio.dart';
import 'package:flutter_pokedex/core/paginator/paginator.dart';
import 'package:flutter_pokedex/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/domain.dart';

class PokemonMovesPaginatedNotifier
    extends StateNotifier<Paginator<List<PokemonMoveDetailed>>> {
  PokemonMovesPaginatedNotifier(this._impl) : super(Paginator.loading());
  final PokemonMoveRespository _impl;

  final List<PokemonMoveDetailed> _moves = [];
  int get moveCount => _moves.length;
  String? _nextURL;
  int _offset = 0;

  void fetchSomeMoves() async {
    logger.fine("fetching ");
    try {
      PokemonMove move = await _impl.getMoves(offset: _offset);
      _nextURL = move.nextURL;
      logger.fine("got move object");
      if (_nextURL != null) {
        _offset =
            int.tryParse(Uri.parse(move.nextURL!).queryParameters["offset"]!) ??
                0;
      }
      logger.fine("trying for more");
      List<PokemonMoveDetailed> movesDetailed =
          await _impl.getDetailedMove(move.results);
      logger.fine("got more");
      state = Paginator.data(_moves..addAll(movesDetailed));
    } on DioError catch (dio, stk) {
      logger.shout(dio);
      Paginator.error(dio, stk);
    } catch (e, stk) {
      logger.shout(e);
      Paginator.error(e, stk);
    }
  }

  void fetchMoreMoves() async {}
}
