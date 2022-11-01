import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../core/data/base_dto/base_endpoint_dto.dart';
import 'dto/pokedex_pokemon_dto.dart';

part 'pokedex_client.g.dart';

@RestApi(
  baseUrl: 'https://pokeapi.co/api/v2/pokemon',
)
abstract class PokedexClient {
  factory PokedexClient(Dio dio, {String baseUrl}) = _PokedexClient;
  @GET("")
  Future<BaseEndpointDto> getPokemons({
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  });

  @GET("{id}")
  Future<PokedexPokemonDto> getPokemonDetailed({
    @Path("id") required int id,
  });
}
