import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widget/core_widgets.dart';
import '../../../context/providers.dart';

class PokeDexPokemonLoadMore extends ConsumerWidget {
  const PokeDexPokemonLoadMore({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(pokedexPokemonProvider).maybeWhen(
          orElse: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
          loadMore: (data) => const SliverToBoxAdapter(
              child: LoadMoreWidget(message: "Fetching")),
          errorLoadMore: (data, err, stk) =>
              const SliverToBoxAdapter(child: LoadMoreErrorWidget()),
          end: (message, data) =>
              SliverToBoxAdapter(child: EndOfListWidget(text: message)));
}
