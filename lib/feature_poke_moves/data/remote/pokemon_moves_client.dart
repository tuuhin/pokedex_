import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../core/data/base_dto/base_dto.dart';
import './dto/pokemon_moves_dto.dart';

part 'pokemon_moves_client.g.dart';

@RestApi(baseUrl: 'https://pokeapi.co/api/v2/move')
abstract class PokemonMovesClient {
  factory PokemonMovesClient(Dio dio, {String baseUrl}) = _PokemonMovesClient;

  @GET("/{id}")
  Future<PokemonMovesDetailedDto> getMovesDetails(
      {@Path("id") required int id});

  @GET("")
  Future<BaseEndpointDto> getMove({
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  });
}
