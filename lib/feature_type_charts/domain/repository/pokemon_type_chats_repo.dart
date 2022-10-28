import '../../../core/models/base_response_results_model.dart';
import '../../../core/models/models.dart';
import '../models/pokemon_types_detailed_model.dart';

abstract class PokemonTypeChartsRepostiory {
  Future<PokemonBaseResponse> getBaseTypeInfo({int? offset, int? limit});
  Future<List<PokemonTypeDetailedModel>> getTypeDetailed(
      List<BaseResponseResults> results);
}
