import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widget/end_of_list_widget.dart';
import '../../core/widget/error/load_more_error_widget.dart';
import '../../core/widget/load_more_widget.dart';
import '../context/provider.dart';

class PokemonMovesLoadMore extends StatelessWidget {
  const PokemonMovesLoadMore({super.key});

  @override
  Widget build(BuildContext context) => Consumer(
      builder: (context, ref, _) => ref.watch(pokeMovesProvider).maybeWhen(
          orElse: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
          loadMore: (data) => const SliverToBoxAdapter(
              child: LoadMoreWidget(message: "Fetching More Moves")),
          errorLoadMore: (data, err, stk) =>
              const SliverToBoxAdapter(child: LoadMoreErrorWidget()),
          end: (message, data) =>
              SliverToBoxAdapter(child: EndOfListWidget(text: message))));
}
