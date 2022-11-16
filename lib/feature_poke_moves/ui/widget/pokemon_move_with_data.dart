import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_poke_moves/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widget/transitions.dart';
import '../../context/provider.dart';
import '../ui.dart';

class PokemonMoveWithData extends ConsumerWidget {
  final List<PokemonMoveDetailed> moves;
  const PokemonMoveWithData(this.moves, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => SliverAnimatedList(
        key: ref.read(pokeMovesProvider.notifier).key,
        itemBuilder: (context, index, animation) => LoadTransition(
          animation: animation,
          child: PokeMonMoveCard(details: moves[index]),
        ),
      );
}
