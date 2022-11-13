import '../../../core/models/base_response_model.dart';
import '../../../core/models/base_response_results_model.dart';
import '../models/models.dart';

abstract class PokedexPokemonRepository {
  Future<PokemonBaseResponse> getPokemons({int? offset, int? limit});
  Future<List<PokedexPokemonModel>> getPokemonInfo(
      List<BaseResponseResults> results);
}
