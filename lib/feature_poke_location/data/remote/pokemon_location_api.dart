import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../core/data/base_dto/base_dto.dart';
import './dto/location_dto.dart';

part 'pokemon_location_api.g.dart';

@RestApi(baseUrl: 'https://pokeapi.co/api/v2/region/')
abstract class PokemonLocationApi {
  factory PokemonLocationApi(Dio dio, {String? baseUrl}) = _PokemonLocationApi;

  @GET('{id}')
  Future<PokemonLocationDto> getRegionInfo({@Path("id") required int id});

  @GET("")
  Future<BaseEndpointDto> getRegions({
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  });
}
