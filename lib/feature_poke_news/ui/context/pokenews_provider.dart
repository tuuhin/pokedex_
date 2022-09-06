import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/singletons/dio_client.dart';
import '../../data/news_data.dart';

final pokeNewsProvider = FutureProvider<List<PokeNewsDto>>((ref) async {
  PokeNewsApiClient client = PokeNewsApiClient(dio);
  List<PokeNewsDto> news = await client.getTasks(count: 100);
  return news;
});
