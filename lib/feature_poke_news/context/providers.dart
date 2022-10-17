import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/paginator/paginator.dart';
import '../context/pagination_notifier.dart';
import '../data/repository/poknewsrepoimpl.dart';
import '../domain/domain.dart';
import './poke_news_provider.dart';

final pokemonNewsRepostiory =
    Provider<PokemonNewsRepostiory>((ref) => PokeMonNewsRespositoryImpl());

final pokeNewsProvider =
    StateNotifierProvider<PokeNewsNotifier, AsyncValue<List<PokemonNewsModel>>>(
  (ref) => PokeNewsNotifier(ref.read(pokemonNewsRepostiory))..init(),
);

final pokeNewsProviderPaginated = StateNotifierProvider<
    PaginatedPokemonNewsNotifier, Paginator<List<PokemonNewsModel>>>(
  (ref) =>
      PaginatedPokemonNewsNotifier(ref.read(pokemonNewsRepostiory))..init(),
);
