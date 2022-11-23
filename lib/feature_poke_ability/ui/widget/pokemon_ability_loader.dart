import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/util/paginator/paginator.dart';
import '../../../core/widget/core_widgets.dart';
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
                  child: LoadingInfo(
                      text: "Fecthing Ability", color: Color(0xffffce4b))),
              loadMore: (data) => PokemonAbilityList(ability: data),
              data: (data) => PokemonAbilityList(ability: data),
              error: (err, stk) => SliverFillRemaining(
                  child: PaginatorErrorWidget(
                      refresh:
                          ref.read(pokemonAbilityProvider.notifier).refresh)),
              errorLoadMore: (data, err, stk) =>
                  PokemonAbilityList(ability: data),
              end: (message, data) => PokemonAbilityList(ability: data),
            ),
      );
}
