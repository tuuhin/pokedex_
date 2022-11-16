import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widget/core_widgets.dart';
import '../context/provider.dart';
import 'widget/pokemon_move_with_data.dart';

class PokeMovesLoader extends ConsumerWidget {
  const PokeMovesLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: ref.watch(pokeMovesProvider).when(
            loading: () => const SliverFillRemaining(
                child: LoadingInfo(
              text: 'Fetching Moves',
              color: Color(0xfff7776a),
            )),
            loadMore: (data) => PokemonMoveWithData(data),
            data: (data) => PokemonMoveWithData(data),
            error: (err, stk) => SliverFillRemaining(
                child: PaginatorErrorWidget(
                    refresh: ref.read(pokeMovesProvider.notifier).refresh)),
            errorLoadMore: (data, err, stk) => PokemonMoveWithData(data),
            end: (message, data) => PokemonMoveWithData(data),
          ),
    );
  }
}
