import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_poke_moves/ui/ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../context/provider.dart';

class PokeMovesLoader extends ConsumerStatefulWidget {
  const PokeMovesLoader({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokeMovesLoaderState();
}

class _PokeMovesLoaderState extends ConsumerState<PokeMovesLoader> {
  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: const EdgeInsets.all(8.0),
        sliver: ref.watch(pokeMovesProvider).when(
            loading: () => const SliverFillRemaining(
                  child: Center(child: Text('loading')),
                ),
            loadMore: (data) => SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => PokeMonMoveCard(details: data[index]),
                    childCount:
                        ref.read(pokeMovesProvider.notifier).moveCount)),
            data: (data) => SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => PokeMonMoveCard(details: data[index]),
                    childCount:
                        ref.read(pokeMovesProvider.notifier).moveCount)),
            error: (err, stk) => SliverToBoxAdapter(child: Text('error')),
            errorLoadMore: (date, err, stk) =>
                SliverToBoxAdapter(child: Text('loading')),
            end: (message, _) =>
                const SliverToBoxAdapter(child: Text('End of moves'))),
      );
}
