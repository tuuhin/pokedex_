import '../../../core/models/base_response_model.dart';
import '../../../core/models/base_response_results_model.dart';
import '../models/pokemon_simplified_model.dart';

abstract class PokemonSimplifiedRepository {
  Future<PokemonBaseResponse> getPokemons({int? offset, int? limit});
  Future<List<PokedexPokemonSimplifiedModel>> getSimplePokemonInfo(
      List<BaseResponseResults> results);
}
