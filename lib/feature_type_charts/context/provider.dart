import 'package:flutter_pokedex/core/util/paginator/paginator.dart';
import 'package:flutter_pokedex/feature_type_charts/context/pokemon_type_charts_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repository/pokemon_type_chats_impl.dart';
import '../domain/models/pokemon_types_detailed_model.dart';
import '../domain/repository/pokemon_type_chats_repo.dart';

final pokemonTypeRepoProvider = Provider<PokemonTypeChartsRepostiory>(
  (ref) => PokemonTypeChartsImpl(),
);

final pokemonTypeChartsProvider = StateNotifierProvider<
        PokemonTypeChartsNotifier, Paginator<List<PokemonTypeDetailedModel>>>(
    (ref) =>
        PokemonTypeChartsNotifier(ref.read(pokemonTypeRepoProvider))..init());
