import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/paginator/paginator.dart';
import '../context/pagination_notifier.dart';
import '../data/repository/poknewsrepoimpl.dart';
import '../domain/domain.dart';

final pokemonNewsRepostiory =
    Provider<PokemonNewsRepostiory>((ref) => PokeMonNewsRespositoryImpl());

final pokeNewsProvider = FutureProvider<List<PokemonNewsModel>>((ref) async {
  PokemonNewsRepostiory client = ref.read(pokemonNewsRepostiory);
  List<PokemonNewsModel> news = await client.getNews(count: 5);
  return news;
});

final pokeNewsProviderPaginated = StateNotifierProvider<
        PaginatedPokemonNewsNotifier, Paginator<List<PokemonNewsModel>>>(
    (ref) =>
        PaginatedPokemonNewsNotifier(ref.read(pokemonNewsRepostiory))..init());
