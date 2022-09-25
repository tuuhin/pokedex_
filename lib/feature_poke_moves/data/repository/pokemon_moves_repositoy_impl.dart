import '../../../core/singletons/dio_client.dart';
import '../../domain/repository/repository.dart';
import '../remote/remote.dart';

class PokemonMovesRespositoryImpl implements PokemonMoveRespository {
  final PokemonMovesClient _client = PokemonMovesClient(dio);

  @override
  Future<PokemonMoveDto> getMoves({int? offset, int? limit}) async =>
      await _client.getMove(offset: offset, limit: limit);

  @override
  Future<PokemonMovesDto> getDetailedMove(int id) async =>
      await _client.getMovesDetails(id: id);
}
