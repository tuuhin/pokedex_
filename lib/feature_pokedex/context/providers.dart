import 'package:flutter_pokedex/core/util/paginator/paginator.dart';
import 'package:flutter_pokedex/feature_pokedex/context/simplified_pokedex_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/util/dio_client.dart';
import '../data/remote/pokedex_client.dart';
import '../data/repo/pokemon_simplified_impl.dart';
import '../domain/models/pokemon_simplified_model.dart';
import '../domain/repository/pokemon_simplified_repo.dart';

final pokedexClientProvider =
    Provider<PokedexClient>((ref) => PokedexClient(dio));

final pokedexSimplifiedRepoProvider = Provider<PokemonSimplifiedRepository>(
  (ref) => PokemonSimplifiedRepoImpl(ref.read(pokedexClientProvider)),
);

final simplifiedPokedexPokemonProvider = StateNotifierProvider<
    SimplifiedPokeDexNotifier, Paginator<List<PokedexPokemonSimplifiedModel>>>(
  (ref) => SimplifiedPokeDexNotifier(ref.read(pokedexSimplifiedRepoProvider))
    ..init(),
);
