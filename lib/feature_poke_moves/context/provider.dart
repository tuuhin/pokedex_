import 'package:flutter_pokedex/feature_poke_moves/context/moves_paginated_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/util/paginator/paginator.dart';
import '../data/repository/repository.dart';
import '../domain/domain.dart';

final pokemonMoveRespositoryProvider = Provider<PokemonMoveRespository>(
  (ref) => PokemonMovesRespositoryImpl(),
);

final pokeMovesProvider = StateNotifierProvider<PokemonMovesPaginatedNotifier,
    Paginator<List<PokemonMoveDetailed>>>(
  (ref) =>
      PokemonMovesPaginatedNotifier(ref.read(pokemonMoveRespositoryProvider))
        ..init(),
);
