import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/paginator/paginator.dart';
import '../../core/singletons/dio_client.dart';
import '../data/news_data.dart';
import '../context/pagination_notifier.dart';

final pokenewsClientProvider =
    Provider<PokeNewsApiClient>((ref) => PokeNewsApiClient(dio));

final pokeNewsProvider = FutureProvider<List<PokeNewsDto>>((ref) async {
  PokeNewsApiClient client = ref.read(pokenewsClientProvider);
  List<PokeNewsDto> news = await client.getNews(count: 5);
  return news;
});

final pokeNewsProviderPaginated = StateNotifierProvider<
        PaginatedPokemonNewsNotifier, Paginator<List<PokeNewsDto>>>(
    (ref) =>
        PaginatedPokemonNewsNotifier(ref.read(pokenewsClientProvider))..init());
