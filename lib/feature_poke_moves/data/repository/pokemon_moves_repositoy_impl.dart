import 'package:flutter_pokedex/core/util/string_helper.dart';
import 'package:flutter_pokedex/main.dart';

import '../../../core/util/dio_client.dart';
import '../../domain/domain.dart';
import '../remote/remote.dart';

class PokemonMovesRespositoryImpl implements PokemonMoveRespository {
  final PokemonMovesClient _client = PokemonMovesClient(dio);

  @override
  Future<List<PokemonMoveDetailed>> getDetailedMove(
      List<PokemonMoveSimplified> results) async {
    List<int> moveIds =
        results.map((simp) => getIdFromString(simp.url) ?? 1).toList();
    List<PokemonMovesDetailedDto> movesDto =
        await Future.wait(moveIds.map((id) => _client.getMovesDetails(id: id)));
    return movesDto.map((e) => e.toMove()).toList();
  }

  @override
  Future<PokemonMove> getMoves({int? offset, int? limit}) async {
    logger.shout("hitting ");
    PokemonMoveDto pokemonMove =
        await _client.getMove(offset: offset, limit: limit);
    logger.shout("hit it");
    return pokemonMove.toModel();
  }
}
