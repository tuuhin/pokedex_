import '../news_data.dart';
import '../../../core/util/dio_client.dart';
import '../../domain/domain.dart';

class PokeMonNewsRespositoryImpl implements PokemonNewsRepostiory {
  final PokeNewsApiClient _api = PokeNewsApiClient(dio);

  @override
  Future<List<PokemonNewsModel>> getNews({int? index, int? count}) async {
    List<PokeNewsDto> news = await _api.getNews(index: index, count: count);
    return news.map((e) => e.toModel()).toList();
  }
}
