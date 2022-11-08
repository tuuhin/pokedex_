import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../core/data/base_dto/base_dto.dart';
import './dto/pokemon_ability_dto.dart';

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
