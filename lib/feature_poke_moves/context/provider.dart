import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/util/dio_client.dart';
import '../../core/util/paginator/paginator.dart';
import '../data/remote/pokemon_moves_client.dart';
import '../data/repository/pokemon_moves_repositoy_impl.dart';
import '../domain/domain.dart';
import './moves_paginated_notifier.dart';

final apiClient =
    Provider<PokemonMovesClient>((ref) => PokemonMovesClient(dio));

final pokemonMoveRespositoryProvider = Provider<PokemonMoveRespository>(
  (ref) => PokemonMovesRespositoryImpl(ref.read(apiClient)),
);

final pokeMovesProvider = StateNotifierProvider<PokemonMovesPaginatedNotifier,
    Paginator<List<PokemonMoveDetailed>>>(
  (ref) =>
      PokemonMovesPaginatedNotifier(ref.read(pokemonMoveRespositoryProvider))
        ..init(),
);
