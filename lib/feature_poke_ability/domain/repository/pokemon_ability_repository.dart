import '../../../core/models/base_response_results_model.dart';
import '../../../core/models/models.dart';
import '../models/pokemon_ability_model.dart';

abstract class PokemonAbilityRespository {
  Future<PokemonBaseResponse> getAbility({int? offset, int? limit});
  Future<List<PokemonAbility>> getDetailedAbility(
      List<BaseResponseResults> results);
}
