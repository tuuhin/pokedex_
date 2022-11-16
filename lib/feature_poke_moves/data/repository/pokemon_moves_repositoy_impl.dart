import '../../../core/data/base_dto/base_endpoint_dto.dart';
import '../../../core/models/base_response_model.dart';
import '../../../core/models/base_response_results_model.dart';
import '../../../core/util/string_helper.dart';
import '../../domain/domain.dart';
import '../remote/remote.dart';

class PokemonMovesRespositoryImpl implements PokemonMoveRespository {
  final PokemonMovesClient _client;

  PokemonMovesRespositoryImpl(this._client);

  @override
  Future<List<PokemonMoveDetailed>> getDetailedMove(
      List<BaseResponseResults> results) async {
    List<int> moveIds =
        results.map((simp) => getIdFromString(simp.url)).toList();
    List<PokemonMovesDetailedDto> movesDto =
        await Future.wait(moveIds.map((id) => _client.getMovesDetails(id: id)));
    return movesDto.map((e) => e.toMove()).toList();
  }

  @override
  Future<PokemonBaseResponse> getMoves({int? offset, int? limit}) async {
    BaseEndpointDto pokemonMove =
        await _client.getMove(offset: offset, limit: limit);
    return pokemonMove.toModel();
  }
}
