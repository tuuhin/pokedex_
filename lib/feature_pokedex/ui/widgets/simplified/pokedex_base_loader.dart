import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../context/providers.dart';
import '../widgets.dart';

class PokeDexPokemonLoader extends ConsumerWidget {
  final int colCount;
  const PokeDexPokemonLoader({super.key, required this.colCount});

  @override
  Widget build(BuildContext context, WidgetRef ref) => SliverPadding(
        padding: const EdgeInsets.all(8.0),
        sliver: ref.watch(pokedexPokemonProvider).when(
            loading: () => const SliverFillRemaining(
                  child: Center(child: Text('loading')),
                ),
            loadMore: (data) => PokemonGridEntry(data: data),
            data: (data) => PokemonGridEntry(data: data),
            error: (err, stk) => const SliverFillRemaining(
                  child: Center(child: Text('Failed')),
                ),
            errorLoadMore: (data, err, stk) => PokemonGridEntry(data: data),
            end: (message, data) => PokemonGridEntry(data: data)),
      );
}
