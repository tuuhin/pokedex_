import 'package:dio/dio.dart';
import 'package:flutter_pokedex/core/data/base_dto/base_endpoint_dto.dart';
import 'package:flutter_pokedex/feature_poke_ability/data/remote/dto/pokemon_ability_dto.dart';
import 'package:retrofit/http.dart';

part 'pokemon_ability_client.g.dart';

@RestApi(baseUrl: 'https://pokeapi.co/api/v2/ability/')
abstract class PokemonAbilityClient {
  factory PokemonAbilityClient(Dio dio, {String baseUrl}) =
      _PokemonAbilityClient;

  @GET("{ability_id}")
  Future<PokemonAbilityDto> getAbilityDetails({
    @Path("ability_id") required int id,
  });

  @GET("")
  Future<BaseEndpointDto> getAbility({
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  });
}
