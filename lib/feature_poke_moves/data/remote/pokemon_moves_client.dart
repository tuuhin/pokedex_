import 'package:dio/dio.dart';
import 'package:flutter_pokedex/core/data/base_dto/base_dto.dart';
import 'package:retrofit/http.dart';

import './dto/pokemon_moves_dto.dart';

part 'pokemon_moves_client.g.dart';

@RestApi(baseUrl: 'https://pokeapi.co/api/v2/move')
abstract class PokemonMovesClient {
  factory PokemonMovesClient(Dio dio, {String baseUrl}) = _PokemonMovesClient;

  @GET("/{move_id}")
  Future<PokemonMovesDetailedDto> getMovesDetails({
    @Path("move_id") required int id,
  });

  @GET("")
  Future<BaseEndpointDto> getMove({
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  });
}
