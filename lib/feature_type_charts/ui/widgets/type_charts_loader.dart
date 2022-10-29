import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_type_charts/context/provider.dart';
import 'package:flutter_pokedex/feature_type_charts/ui/widgets/type_chart_Card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widget/transitions.dart';

class TypeChartsLoader extends ConsumerWidget {
  const TypeChartsLoader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => SliverPadding(
        padding: const EdgeInsets.all(8.0),
        sliver: ref.watch(pokemonTypeChartsProvider).when(
              loading: () => const SliverFillRemaining(
                child: Center(child: Text('loading')),
              ),
              loadMore: (data) => SliverAnimatedList(
                key: ref.read(pokemonTypeChartsProvider.notifier).listKey,
                itemBuilder: (context, index, animation) => LoadTransition(
                  animation: animation,
                  child: PokemonTypeChartsCard(
                    details: data[index],
                  ),
                ),
              ),
              data: (data) => SliverAnimatedList(
                key: ref.read(pokemonTypeChartsProvider.notifier).listKey,
                itemBuilder: (context, index, animation) => LoadTransition(
                  animation: animation,
                  child: PokemonTypeChartsCard(
                    details: data[index],
                  ),
                ),
              ),
              error: (err, stk) => SliverFillRemaining(
                child: Center(
                  child: Text(err.toString()),
                ),
              ),
              errorLoadMore: (data, err, stk) => SliverAnimatedList(
                key: ref.read(pokemonTypeChartsProvider.notifier).listKey,
                itemBuilder: (context, index, animation) => LoadTransition(
                  animation: animation,
                  child: PokemonTypeChartsCard(
                    details: data[index],
                  ),
                ),
              ),
              end: (message, data) => SliverAnimatedList(
                key: ref.read(pokemonTypeChartsProvider.notifier).listKey,
                itemBuilder: (context, index, animation) => LoadTransition(
                  animation: animation,
                  child: PokemonTypeChartsCard(
                    details: data[index],
                  ),
                ),
              ),
            ),
      );
}
