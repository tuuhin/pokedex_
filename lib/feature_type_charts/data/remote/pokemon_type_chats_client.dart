import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../core/data/base_dto/base_dto.dart';
import './dto/pokemon_type_charts_dto.dart';

part 'pokemon_type_chats_client.g.dart';

@RestApi(baseUrl: 'https://pokeapi.co/api/v2/type/')
abstract class PokemonTypeChartsClient {
  factory PokemonTypeChartsClient(Dio dio, {String baseUrl}) =
      _PokemonTypeChartsClient;

  @GET("")
  Future<BaseEndpointDto> getBaseInfo({
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  });

  @GET('{id}')
  Future<PokemonTypeChartsDto> getTypeDetailed({@Path("id") required int id});
}
