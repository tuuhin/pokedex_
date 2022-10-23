import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../context/provider.dart';

class PokemonAbilityLoadMore extends ConsumerWidget {
  const PokemonAbilityLoadMore({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(pokemonAbilityProvider).maybeWhen(
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
            end: (message, data) => SliverToBoxAdapter(child: Text(message)),
          );
}
