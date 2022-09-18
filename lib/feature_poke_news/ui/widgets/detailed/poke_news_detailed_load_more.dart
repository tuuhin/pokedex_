import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../context/providers.dart';

class PokeDetailedNewsLoadMore extends ConsumerWidget {
  const PokeDetailedNewsLoadMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(pokeNewsProviderPaginated).maybeWhen(
          orElse: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
          loadMore: (data) => const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
          errorLoadMore: (date, err, stk) => SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$err'),
            ),
          ),
        );
  }
}
