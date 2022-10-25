import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/data/base_dto/base_endpoint_dto.dart';
import './remote.dart';

part 'pokemon_item_client.g.dart';

@RestApi(baseUrl: 'https://pokeapi.co/api/v2/item/')
abstract class PokemonItemClient {
  factory PokemonItemClient(Dio dio, {String baseUrl}) = _PokemonItemClient;

  @GET("{item_id}")
  Future<PokemonItemDto> getItemDetailed({
    @Path("item_id") required int id,
  });

  @GET("")
  Future<BaseEndpointDto> getItems({
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  });
}
