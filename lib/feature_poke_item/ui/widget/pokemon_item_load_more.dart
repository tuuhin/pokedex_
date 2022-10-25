import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_poke_item/context/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonItemLoadMore extends StatelessWidget {
  const PokemonItemLoadMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) =>
          ref.watch(poekmonItemProvider).maybeWhen(
                orElse: () => const SliverToBoxAdapter(
                  child: SizedBox.shrink(),
                ),
                data: (data) => const SliverFillRemaining(
                  child: Text('data'),
                ),
              ),
    );
  }
}
