import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../context/providers.dart';
import '../../../../core/widget/core_widgets.dart';

class PokeDetailedNewsLoadMore extends ConsumerWidget {
  const PokeDetailedNewsLoadMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(pokeNewsProviderPaginated).maybeWhen(
          orElse: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
          loadMore: (data) => const SliverToBoxAdapter(
              child: LoadMoreWidget(message: "Fetching")),
          errorLoadMore: (data, err, stk) =>
              const SliverToBoxAdapter(child: LoadMoreErrorWidget()),
          end: (message, data) =>
              SliverToBoxAdapter(child: EndOfListWidget(text: message)));
}
