import '../../../core/data/base_dto/base_endpoint_dto.dart';
import '../../../core/models/base_response_model.dart';
import '../../../core/models/base_response_results_model.dart';
import '../../../core/util/dio_client.dart';
import '../../../core/util/string_helper.dart';
import '../../domain/models/pokemon_types_detailed_model.dart';
import '../../domain/repository/pokemon_type_chats_repo.dart';
import '../remote/remote.dart';

class PokemonTypeChartsImpl implements PokemonTypeChartsRepostiory {
  final PokemonTypeChartsClient _clt = PokemonTypeChartsClient(dio);
  @override
  Future<PokemonBaseResponse> getBaseTypeInfo({int? offset, int? limit}) async {
    BaseEndpointDto dto = await _clt.getBaseInfo(offset: offset, limit: limit);
    return dto.toModel();
  }

  @override
  Future<List<PokemonTypeDetailedModel>> getTypeDetailed(
      List<BaseResponseResults> results) async {
    Iterable<int> ids = results.map((e) => getIdFromString(e.url) ?? 1);
    Iterable<PokemonTypeChartsDto> detailedTypes = await Future.wait(
        ids.map((id) => _clt.getTypeDetailed(id: id)),
        eagerError: true);
    return detailedTypes.map((e) => e.toModel()).toList();
  }
}
