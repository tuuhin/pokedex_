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
  Widget build(BuildContext context) => ref.watch(pokeMovesProvider).when(
      loading: () => SliverToBoxAdapter(child: Text('loading')),
      loadMore: (data) => SliverToBoxAdapter(child: Text('load more ')),
      data: (data) => SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => PokeMonMoveCard(details: data[index]),
              childCount: ref.read(pokeMovesProvider.notifier).moveCount)),
      error: (err, stk) => SliverToBoxAdapter(child: Text('error')),
      errorLoadMore: (date, err, stk) =>
          SliverToBoxAdapter(child: Text('loading')),
      end: (message) => SliverToBoxAdapter(child: Text('loading')));
}
