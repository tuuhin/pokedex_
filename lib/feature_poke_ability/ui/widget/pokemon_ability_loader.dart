import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/util/paginator/paginator.dart';
import '../../../core/widget/transitions.dart';
import '../../context/provider.dart';
import '../../domain/models/pokemon_ability_model.dart';
import '../ui.dart';

class PokemonAbilityLoader extends ConsumerWidget {
  const PokemonAbilityLoader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
        sliver: ref
            .watch<Paginator<List<PokemonAbility>>>(pokemonAbilityProvider)
            .when(
              loading: () => const SliverFillRemaining(
                child: Center(child: Text('loading')),
              ),
              loadMore: (data) => SliverAnimatedList(
                key: ref.read(pokemonAbilityProvider.notifier).key,
                itemBuilder: (context, index, animation) => LoadTransition(
                  animation: animation,
                  child: PokemonAbilityCard(
                    ability: data[index],
                  ),
                ),
              ),
              data: (data) => SliverAnimatedList(
                key: ref.read(pokemonAbilityProvider.notifier).key,
                itemBuilder: (context, index, animation) => LoadTransition(
                  animation: animation,
                  child: PokemonAbilityCard(
                    ability: data[index],
                  ),
                ),
              ),
              error: (err, stk) => SliverFillRemaining(
                child: Center(
                  child: Text(err.toString()),
                ),
              ),
              errorLoadMore: (data, err, stk) => SliverAnimatedList(
                key: ref.read(pokemonAbilityProvider.notifier).key,
                itemBuilder: (context, index, animation) => LoadTransition(
                  animation: animation,
                  child: PokemonAbilityCard(
                    ability: data[index],
                  ),
                ),
              ),
              end: (message, data) => SliverAnimatedList(
                key: ref.read(pokemonAbilityProvider.notifier).key,
                itemBuilder: (context, index, animation) => LoadTransition(
                  animation: animation,
                  child: PokemonAbilityCard(
                    ability: data[index],
                  ),
                ),
              ),
            ),
      );
}
