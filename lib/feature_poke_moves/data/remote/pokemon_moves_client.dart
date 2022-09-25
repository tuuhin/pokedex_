import 'package:dio/dio.dart';
import 'package:flutter_pokedex/feature_poke_moves/data/remote/dto/pokemon_move_dto.dart';
import 'package:retrofit/http.dart';

import './dto/pokemon_moves_dto.dart';

part 'pokemon_moves_client.g.dart';

@RestApi(baseUrl: 'https://pokeapi.co/api/v2')
abstract class PokemonMovesClient {
  factory PokemonMovesClient(Dio dio, {String baseUrl}) = _PokemonMovesClient;

  @GET("move/{move_id}")
  Future<PokemonMovesDto> getMovesDetails({
    @Path("move_id") required int id,
  });

  @GET("move")
  Future<PokemonMoveDto> getMove({
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  });
}
