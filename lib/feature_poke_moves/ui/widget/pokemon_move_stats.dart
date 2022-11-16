import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/data/pokemon_type/pokemon_type.dart';
import 'package:flutter_pokedex/feature_poke_moves/domain/domain.dart';
import 'package:flutter_pokedex/feature_poke_moves/ui/widget/pokemon_move_stats_bar.dart';

class PokemonMoveStats extends StatelessWidget {
  final PokemonMoveDetailed details;
  const PokemonMoveStats({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    final Color secondaryColor =
        PokeMonType.getPokeMonTypeByName(details.moveType).secondaryColor;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: secondaryColor.withOpacity(0.1),
            border:
                Border.all(color: secondaryColor.withOpacity(0.5), width: 2),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            PokemonMoveStatsBar(
                name: "Accuracy",
                secondaryColor: secondaryColor,
                value: details.accuracy),
            PokemonMoveStatsBar(
              name: "pp",
              secondaryColor: secondaryColor,
              value: details.pp,
            ),
            PokemonMoveStatsBar(
                name: "Power",
                secondaryColor: secondaryColor,
                value: details.power),
            PokemonMoveStatsBar(
              name: "Priority",
              secondaryColor: secondaryColor,
              value: details.priority,
            ),
          ],
        ),
      ),
    );
  }
}
