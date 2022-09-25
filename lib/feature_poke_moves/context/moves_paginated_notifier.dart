import 'package:flutter_pokedex/core/paginator/paginator.dart';
import 'package:flutter_pokedex/core/util/string_helper.dart';
import 'package:flutter_pokedex/feature_poke_moves/data/repository/pokemon_moves_repositoy_impl.dart';
import 'package:flutter_pokedex/feature_poke_moves/domain/models/pokemon_move_detail_model.dart';
import 'package:flutter_pokedex/feature_poke_moves/domain/models/pokemon_move_simplified_model.dart';
import 'package:flutter_pokedex/feature_poke_moves/domain/repository/pokemon_move_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/remote/dto/pokemon_move_dto.dart';
import '../data/remote/dto/pokemon_moves_dto.dart';

class PokemonMovesPaginatedNotifier
    extends StateNotifier<Paginator<PokemonMoveDetailed>> {
  PokemonMovesPaginatedNotifier(this._respositoryImpl)
      : super(Paginator.loading());
  final PokemonMovesRespositoryImpl _respositoryImpl;

  final List<PokemonMoveDetailed> _moves = [];
  int offset = 0;

  void fetchPokeMoves() async {
    try {
      PokemonMoveDto moveinfo = _moves.isNotEmpty
          ? await _respositoryImpl.getMoves(offset: offset)
          : await _respositoryImpl.getMoves();
      List<PokemonMovesDto> moves = await Future.wait<PokemonMovesDto>(
          moveinfo.results.map((e) =>
              _respositoryImpl.getDetailedMove(getIdFromString(e.url) ?? 1)));
    } catch (e, stk) {
      state = Paginator.error(e, stk);
    }
  }
}
