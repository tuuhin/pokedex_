import 'package:flutter_pokedex/core/util/paginator/paginator.dart';
import 'package:flutter_pokedex/feature_poke_item/context/pokemon_item_provider.dart';
import 'package:flutter_pokedex/feature_poke_item/domain/models/pokemon_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repository/pokemon_item_repo_impl.dart';
import '../domain/repository/pokemon_item_repository.dart';

final _pokemonItemRepositoryProvider =
    Provider<PokemonItemRepository>((ref) => PokemonItemRepositoryImpl());

final poekmonItemProvider = StateNotifierProvider<PokemonItemNotifier,
    Paginator<List<PokemonItemModel>>>(
  (ref) => PokemonItemNotifier(
    ref.read(_pokemonItemRepositoryProvider),
  )..init(),
);
