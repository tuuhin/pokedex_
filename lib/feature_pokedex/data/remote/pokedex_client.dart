import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../core/data/base_dto/base_dto.dart';
import 'remote.dart';

part 'pokedex_client.g.dart';

@RestApi(
  baseUrl: 'https://pokeapi.co/api/v2/',
)
abstract class PokedexClient {
  factory PokedexClient(Dio dio, {String baseUrl}) = _PokedexClient;
  @GET("pokemon")
  Future<BaseEndpointDto> getPokemons({
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  });

  @GET("pokemon/{id}")
  Future<PokedexPokemonDto> getPokemonDetailedById({
    @Path("id") required int id,
  });

  @GET("pokemon/{name}")
  Future<PokedexPokemonDto> getPokemonDetailedByName({
    @Path("name") required String name,
  });

  @GET("evolution-chain")
  Future<BaseEndpointDto> getEvolutionChain({
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  });

  @GET("evolution-chain/{id}")
  Future<EvolutionChainDetailsDto> getEvolutionChainDetailed({
    @Path("id") required id,
  });

  @GET("pokemon-species")
  Future<BaseEndpointDto> getSpecies({
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  });

  @GET("pokemon-species/{id}")
  Future<PokemonSpeciesDto> getSpeciesDetailed({
    @Path("id") required id,
  });
}
