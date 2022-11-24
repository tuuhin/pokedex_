import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/widget/core_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../context/providers.dart';
import '../widgets.dart';

class PokeDexPokemonLoader extends ConsumerWidget {
  const PokeDexPokemonLoader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => SliverPadding(
        padding: const EdgeInsets.all(8.0),
        sliver: ref.watch(pokedexPokemonProvider).when(
            loading: () => const SliverFillRemaining(
                child: LoadingInfo(
                    text: "Fetching POkemons", color: Color(0xff4fc1a6))),
            error: (err, stk) => SliverFillRemaining(
                    child: PaginatorErrorWidget(
                  refresh: ref.read(pokedexPokemonProvider.notifier).refresh,
                )),
            loadMore: (data) => PokemonGridEntry(data: data),
            data: (data) => PokemonGridEntry(data: data),
            errorLoadMore: (data, err, stk) => PokemonGridEntry(data: data),
            end: (message, data) => PokemonGridEntry(data: data)),
      );
}
