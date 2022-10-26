import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widget/transitions.dart';
import '../../context/providers.dart';
import 'pokemon_item_card.dart';

class PokemonItemsLoader extends ConsumerWidget {
  const PokemonItemsLoader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: ref.watch(pokemonItemProvider).when(
            loading: () => const SliverFillRemaining(
              child: Center(child: Text('loading')),
            ),
            loadMore: (data) => SliverAnimatedList(
              key: ref.read(pokemonItemProvider.notifier).key,
              itemBuilder: (context, index, animation) => LoadTransition(
                animation: animation,
                child: PokemonItemCard(
                  item: data[index],
                ),
              ),
            ),
            data: (data) => SliverAnimatedList(
              key: ref.read(pokemonItemProvider.notifier).key,
              itemBuilder: (context, index, animation) => LoadTransition(
                animation: animation,
                child: PokemonItemCard(
                  item: data[index],
                ),
              ),
            ),
            error: (err, stk) => SliverFillRemaining(
              child: Center(
                child: Text(err.toString()),
              ),
            ),
            errorLoadMore: (data, err, stk) => SliverAnimatedList(
              key: ref.read(pokemonItemProvider.notifier).key,
              itemBuilder: (context, index, animation) => LoadTransition(
                animation: animation,
                child: PokemonItemCard(
                  item: data[index],
                ),
              ),
            ),
            end: (message, data) => SliverAnimatedList(
              key: ref.read(pokemonItemProvider.notifier).key,
              itemBuilder: (context, index, animation) => LoadTransition(
                animation: animation,
                child: PokemonItemCard(
                  item: data[index],
                ),
              ),
            ),
          ));
}
