import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/util/dio_client.dart';
import '../../core/util/paginator/paginator.dart';
import '../data/remote/pokedex_client.dart';
import '../data/repo/evolution_chain_repo_impl.dart';
import '../data/repo/pokemon_pokedex_repo_impl.dart';
import '../data/repo/pokemon_species_repo_impl.dart';
import '../data/util/evolution_chain_data.dart';
import '../domain/models/models.dart';
import '../domain/repository/evolution_chain_repo.dart';
import '../domain/repository/pokedex_pokemon_repo.dart';
import '../domain/repository/pokemon_species_repo.dart';

import './context.dart';

final pokedexClientProvider =
    Provider<PokedexClient>((ref) => PokedexClient(dio));

final pokedexSimplifiedRepoProvider = Provider<PokedexPokemonRepository>(
  (ref) => PokedexPokemonRepoImpl(ref.read(pokedexClientProvider)),
);

final pokemonSpeciesRepo = Provider<PokemonSpeciesRepository>(
    (ref) => PokemonSpeciesRepoImpl(ref.read(pokedexClientProvider)));

final pokemonEvchainRepo = Provider<EvolutionChainRepository>(
    (ref) => EvolutionChainRepoImpl(ref.read(pokedexClientProvider)));

final pokedexPokemonProvider = StateNotifierProvider<PokedexPokemonNotifier,
    Paginator<List<PokedexPokemonModel>>>(
  (ref) =>
      PokedexPokemonNotifier(ref.read(pokedexSimplifiedRepoProvider))..init(),
);

final evolutionChainProvider = StateNotifierProvider.autoDispose
    .family<EvolutionChainNotifier, EvolutionChainData, int?>(
  (ref, arg) {
    // ref.keepAlive();
    return EvolutionChainNotifier(ref.read(pokemonEvchainRepo))
      ..getEvChain(arg);
  },
);

final evolutionIdProvider = StateNotifierProvider<EvoltutionIdProvider, int?>(
    (ref) => EvoltutionIdProvider());

final pokemonSpeciesProvider = StateNotifierProvider.autoDispose
    .family<PokemonSpeciesNotifier, AsyncValue<PokemonSpeciesModel>, int>(
  (ref, pokeId) {
    return PokemonSpeciesNotifier(ref.read(pokemonSpeciesRepo), ref: ref)
      ..getSpeciesData(pokeId);
  },
);

// final currentDetailedPokemon = StateNotifierProvider.family<
//     DetailedPokemonNotifier, PokedexPokemonModel, PokedexPokemonModel>(
//   (ref, PokedexPokemonModel arg) {
//     ref.onDispose(() {
//       logger.fine("disposed");
//     });

//     return DetailedPokemonNotifier(arg);
//   },
// );

final currentSelectedPokemon = StateNotifierProvider.autoDispose.family<
    DetailedPokedexPokemonNotifier,
    AsyncValue<PokedexPokemonModel>,
    int>((ref, model) {
  // ref.keepAlive();

  List<PokedexPokemonModel> pokemons =
      ref.read(pokedexPokemonProvider.notifier).pokemons;

  return DetailedPokedexPokemonNotifier(ref.read(pokedexSimplifiedRepoProvider))
    ..getPokemonDetailsData(model, pokemons);
});
