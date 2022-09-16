import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'news_data.dart';

part 'poke_news_api_client.g.dart';

@RestApi(
  baseUrl: 'https://api.pokemon.com/us/api',
)
abstract class PokeNewsApiClient {
  factory PokeNewsApiClient(Dio dio, {String baseUrl}) = _PokeNewsApiClient;
  @GET("/news")
  Future<List<PokeNewsDto>> getNews({
    @Query("index") int? index,
    @Query("count") int? count = 10,
  });
}
