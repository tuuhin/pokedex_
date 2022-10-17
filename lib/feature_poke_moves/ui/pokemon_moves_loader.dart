import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_poke_moves/ui/ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widget/transitions.dart';
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
              loadMore: (data) => SliverAnimatedList(
                key: ref.read(pokeMovesProvider.notifier).key,
                itemBuilder: (context, index, animation) => LoadTransition(
                  animation: animation,
                  child: PokeMonMoveCard(details: data[index]),
                ),
              ),
              data: (data) => SliverAnimatedList(
                key: ref.read(pokeMovesProvider.notifier).key,
                itemBuilder: (context, index, animation) => LoadTransition(
                  animation: animation,
                  child: PokeMonMoveCard(details: data[index]),
                ),
              ),
              error: (err, stk) => SliverFillRemaining(
                child: Center(
                  child: Text(err.toString()),
                ),
              ),
              errorLoadMore: (data, err, stk) => SliverAnimatedList(
                key: ref.read(pokeMovesProvider.notifier).key,
                itemBuilder: (context, index, animation) => LoadTransition(
                  animation: animation,
                  child: PokeMonMoveCard(details: data[index]),
                ),
              ),
              end: (message, data) => SliverAnimatedList(
                key: ref.read(pokeMovesProvider.notifier).key,
                itemBuilder: (context, index, animation) => LoadTransition(
                  animation: animation,
                  child: PokeMonMoveCard(details: data[index]),
                ),
              ),
            ),
      );
}
