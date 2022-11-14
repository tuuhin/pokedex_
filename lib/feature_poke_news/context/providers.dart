import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/util/dio_client.dart';
import '../../core/util/paginator/paginator.dart';
import '../data/news_data.dart';
import '../data/repository/poknewsrepoimpl.dart';
import '../domain/domain.dart';
import './poke_news_provider.dart';
import 'poke_news_provider_simple.dart';

final newsClient = Provider<PokeNewsApiClient>((ref) => PokeNewsApiClient(dio));

final pokemonNewsRepostiory = Provider<PokemonNewsRepostiory>(
    (ref) => PokeMonNewsRespositoryImpl(ref.read(newsClient)));

final pokeNewsProvider = StateNotifierProvider<PokeNewsNotifierSimple,
        AsyncValue<List<PokemonNewsModel>>>(
    (ref) => PokeNewsNotifierSimple(ref.read(pokemonNewsRepostiory))..init());

final pokeNewsProviderPaginated = StateNotifierProvider<PokemonNewsNotifier,
    Paginator<List<PokemonNewsModel>>>(
  (ref) {
    return PokemonNewsNotifier(ref.read(pokemonNewsRepostiory))..init();
  },
);
