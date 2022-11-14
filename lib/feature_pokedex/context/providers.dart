import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/util/dio_client.dart';
import '../../core/util/paginator/paginator.dart';
import '../data/remote/pokedex_client.dart';
import '../data/repo/evolution_chain_repo_impl.dart';
import '../data/repo/pokemon_pokedex_repo_impl.dart';
import '../domain/models/evolution_chain_details_model.dart';
import '../domain/models/pokedex_model.dart';
import '../domain/repository/pokedex_pokemon_repo.dart';
import './pokedex_pokemon_provider.dart';

final pokedexClientProvider =
    Provider<PokedexClient>((ref) => PokedexClient(dio));

final pokedexSimplifiedRepoProvider = Provider<PokedexPokemonRepository>(
  (ref) => PokedexPokemonRepoImpl(ref.read(pokedexClientProvider)),
);

final pokedexPokemonProvider = StateNotifierProvider<PokedexPokemonNotifier,
    Paginator<List<PokedexPokemonModel>>>(
  (ref) =>
      PokedexPokemonNotifier(ref.read(pokedexSimplifiedRepoProvider))..init(),
);

final evolutionChainProvider =
    FutureProvider.autoDispose.family<EvolutionChainDetailedModel, int>(
  (ref, arg) {
    return EvolutionChainRepoImpl(ref.read(pokedexClientProvider))
        .getEvolutionDetials(arg);
  },
);
