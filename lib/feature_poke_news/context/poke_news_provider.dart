import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/pokemon_news_models.dart';
import '../domain/repository/pokemon_news_repository.dart';

class PokeNewsNotifier
    extends StateNotifier<AsyncValue<List<PokemonNewsModel>>> {
  PokeNewsNotifier(this._impl) : super(const AsyncValue.loading());
  final PokemonNewsRepostiory _impl;

  void init() => _loadPokeNews();

  void _loadPokeNews() async {
    try {
      List<PokemonNewsModel> news = await _impl.getNews(count: 5);
      state = AsyncValue.data(news);
    } catch (e, stk) {
      state = AsyncValue.error(e, stackTrace: stk);
    }
  }
}
