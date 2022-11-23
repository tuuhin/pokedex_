import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widget/core_widgets.dart';
import '../../context/providers.dart';
import 'widget.dart';

class PokemonItemsLoader extends ConsumerWidget {
  const PokemonItemsLoader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        sliver: ref.watch(pokemonItemProvider).when(
            loading: () => const SliverFillRemaining(
                child: LoadingInfo(
                    text: "Fecthing Items", color: Color(0xffffce4b))),
            loadMore: (data) => PokemonItemList(data),
            data: (data) => PokemonItemList(data),
            error: (err, stk) => SliverFillRemaining(
                child: PaginatorErrorWidget(
                    refresh: ref.read(pokemonItemProvider.notifier).refresh)),
            errorLoadMore: (data, err, stk) => PokemonItemList(data),
            end: (message, data) => PokemonItemList(data)),
      );
}
