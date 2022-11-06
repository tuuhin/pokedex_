import '../../../core/data/base_dto/base_endpoint_dto.dart';
import '../../../core/models/base_response_model.dart';
import '../../../core/models/base_response_results_model.dart';
import '../../../core/util/string_helper.dart';
import '../../../main.dart';
import '../../domain/models/pokemon_simplified_model.dart';
import '../../domain/repository/pokemon_simplified_repo.dart';
import '../../data/remote/remote.dart';

class PokemonSimplifiedRepoImpl implements PokemonSimplifiedRepository {
  PokemonSimplifiedRepoImpl(this.clt);

  final PokedexClient clt;
  @override
  Future<PokemonBaseResponse> getPokemons({int? offset, int? limit}) async {
    BaseEndpointDto resp = await clt.getPokemons(offset: offset, limit: limit);
    return resp.toModel();
  }

  @override
  Future<List<PokedexPokemonSimplifiedModel>> getSimplePokemonInfo(
      List<BaseResponseResults> results) async {
    Iterable<int> ids = results.map((e) => getIdFromString(e.url) ?? 1);
    Iterable<PokedexPokemonDto> pokemons = await Future.wait(
        ids.map((id) => clt.getPokemonDetailedById(id: id)),
        eagerError: true,
        cleanUp: (successValue) => logger.fine(successValue));
    return pokemons.map((e) => e.toSimpleModel()).toList();
  }
}
