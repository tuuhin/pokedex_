import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../context/providers.dart';

class PokeDetailedNewsLoadMore extends ConsumerWidget {
  const PokeDetailedNewsLoadMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(pokeNewsProviderPaginated).maybeWhen(
          orElse: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
          loadMore: (data) => SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CircularProgressIndicator(),
                  Text('Loading more...')
                ],
              ),
            ),
          ),
          errorLoadMore: (date, err, stk) => SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$err'),
            ),
          ),
          end: (message, data) => const Text('We reached end'),
        );
  }
}
