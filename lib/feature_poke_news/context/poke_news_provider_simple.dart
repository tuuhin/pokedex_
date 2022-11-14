import 'package:flutter_pokedex/feature_poke_news/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokeNewsNotifierSimple
    extends StateNotifier<AsyncValue<List<PokemonNewsModel>>> {
  PokeNewsNotifierSimple(this._repostiory) : super(const AsyncValue.loading());

  final PokemonNewsRepostiory _repostiory;

  void init() => _loadNews();

  void tryAgain() {
    state = const AsyncValue.loading();
    _loadNews();
  }

  void _loadNews() async {
    // This approach is better because here we have the try catch block
    // But in direct FutureProvider there is no direct way to catch the error
    try {
      state = AsyncValue.data(await _repostiory.getNews());
    } catch (error, stk) {
      state = AsyncValue.error(error, stk);
    }
  }
}
