import '../../../core/models/base_response_results_model.dart';
import '../../../core/models/models.dart';
import '../domain.dart';

abstract class LocationRepository {
  Future<PokemonBaseResponse> getLocation({int? offset, int? limit});

  Future<List<LocationModel>> getLocationsInfo(
    List<BaseResponseResults> results,
  );
}
