import '../../../core/data/base_dto/base_endpoint_dto.dart';
import '../../../core/models/base_response_model.dart';
import '../../../core/models/base_response_results_model.dart';
import '../../../core/util/string_helper.dart';

import '../../domain/models/pokedex_model.dart';
import '../../domain/repository/pokedex_pokemon_repo.dart';
import '../../data/remote/remote.dart';

class PokedexPokemonRepoImpl implements PokedexPokemonRepository {
  PokedexPokemonRepoImpl(this.clt);

  final PokedexClient clt;
  @override
  Future<PokemonBaseResponse> getPokemons({int? offset, int? limit}) async {
    BaseEndpointDto resp = await clt.getPokemons(offset: offset, limit: limit);
    return resp.toModel();
  }

  @override
  Future<List<PokedexPokemonModel>> getPokemonInfo(
      List<BaseResponseResults> results) async {
    Iterable<int> ids = results.map((e) => getIdFromString(e.url));
    List<PokedexPokemonModel> pokemons =
        await Future.wait(ids.map((id) => getPokemonDetailed(id)));
    return pokemons;
  }

  @override
  Future<PokedexPokemonModel> getPokemonDetailed(int id) async {
    PokedexPokemonDto dto = await clt.getPokemonDetailedById(id: id);
    return dto.toModel();
  }
}
