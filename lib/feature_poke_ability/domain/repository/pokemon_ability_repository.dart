import '../../../core/models/models.dart';
import '../models/pokemon_ability.dart';

abstract class PokemonAbilityRespository {
  Future<PokemonBaseResponse<PokemonAbility>> getAbility(
      {int? offset, int? limit});
  // Future<PokemonAbility> getDetailedAbility();
}
