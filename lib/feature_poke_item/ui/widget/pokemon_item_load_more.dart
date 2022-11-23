import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_poke_item/context/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widget/core_widgets.dart';

class PokemonItemLoadMore extends StatelessWidget {
  const PokemonItemLoadMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, _) => ref.watch(pokemonItemProvider).maybeWhen(
            orElse: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
            loadMore: (data) => const SliverToBoxAdapter(
                child: LoadMoreWidget(message: "Fetching More Moves")),
            errorLoadMore: (data, err, stk) =>
                const SliverToBoxAdapter(child: LoadMoreErrorWidget()),
            end: (message, data) =>
                SliverToBoxAdapter(child: EndOfListWidget(text: message))));
  }
}
