import '../remote/remote.dart';
import '../../../core/data/base_dto/base_dto.dart';
import '../../../core/util/string_helper.dart';
import '../../domain/domain.dart';
import '../../../core/models/models.dart';
import '../../../core/models/base_response_results_model.dart';

class LocationRepoImpl implements LocationRepository {
  final PokemonLocationApi _api;

  LocationRepoImpl(this._api);
  @override
  Future<PokemonBaseResponse> getLocation({int? offset, int? limit}) async {
    BaseEndpointDto ability =
        await _api.getRegions(offset: offset, limit: limit);
    return ability.toModel();
  }

  @override
  Future<List<LocationModel>> getLocationsInfo(
      List<BaseResponseResults> results) async {
    Iterable<int> ids = results.map((e) => getIdFromString(e.url));
    Iterable<PokemonLocationDto> regions = await Future.wait(
        ids.map((id) => _api.getRegionInfo(id: id)),
        eagerError: true);
    return regions.map((e) => e.toModel()).toList();
  }
}
