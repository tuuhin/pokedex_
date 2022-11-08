import '../../../core/data/base_dto/base_endpoint_dto.dart';
import '../../../core/models/base_response_model.dart';
import '../../../core/models/base_response_results_model.dart';
import '../../../core/util/string_helper.dart';
import '../../domain/models/pokemon_ability_model.dart';
import '../remote/dto/pokemon_ability_dto.dart';
import '../remote/pokemon_ability_client.dart';
import '../../domain/repository/pokemon_ability_repository.dart';

class PokemonAbilityRepositoryImpl implements PokemonAbilityRespository {
  final PokemonAbilityClient _clt;

  PokemonAbilityRepositoryImpl(this._clt);

  @override
  Future<PokemonBaseResponse> getAbility({int? offset, int? limit}) async {
    BaseEndpointDto ability =
        await _clt.getAbility(offset: offset, limit: limit);
    return ability.toModel();
  }

  @override
  Future<List<PokemonAbility>> getDetailedAbility(
      List<BaseResponseResults> results) async {
    Iterable<int> ids = results.map((e) => getIdFromString(e.url) ?? 1);
    Iterable<PokemonAbilityDto> ability = await Future.wait(
        ids.map((id) => _clt.getAbilityDetails(id: id)),
        eagerError: true);
    return ability.map((e) => e.toModel()).toList();
  }
}
