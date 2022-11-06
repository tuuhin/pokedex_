import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../context/providers.dart';
import '../widgets.dart';

class PokeDexPokemonLoader extends ConsumerWidget {
  const PokeDexPokemonLoader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(simplifiedPokedexPokemonProvider).when(
            loading: () => const SliverFillRemaining(
              child: Center(child: Text('loading')),
            ),
            loadMore: (data) => SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => PokedexSimplifiedEntry(
                    model: data[index],
                  ),
                  childCount: data.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  crossAxisCount: 2,
                  childAspectRatio: 1.25,
                ),
              ),
            ),
            data: (data) => SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => PokedexSimplifiedEntry(
                    model: data[index],
                  ),
                  childCount: data.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  crossAxisCount: 2,
                  childAspectRatio: 1.25,
                ),
              ),
            ),
            error: (err, stk) => const SliverFillRemaining(
              child: Center(child: Text('Failed')),
            ),
            errorLoadMore: (data, err, stk) => SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => PokedexSimplifiedEntry(
                    model: data[index],
                  ),
                  childCount: data.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  crossAxisCount: 2,
                  childAspectRatio: 1.25,
                ),
              ),
            ),
            end: (message, data) => SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => PokedexSimplifiedEntry(
                    model: data[index],
                  ),
                  childCount: data.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  crossAxisCount: 2,
                  childAspectRatio: 1.25,
                ),
              ),
            ),
          );
}
