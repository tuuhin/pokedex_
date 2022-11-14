import '../news_data.dart';
import '../../domain/domain.dart';

class PokeMonNewsRespositoryImpl implements PokemonNewsRepostiory {
  final PokeNewsApiClient _api;

  PokeMonNewsRespositoryImpl(this._api);

  @override
  Future<List<PokemonNewsModel>> getNews({int? index, int? count}) async {
    List<PokeNewsDto> news = await _api.getNews(index: index, count: count);
    return news.map((e) => e.toModel()).toList();
  }
}
