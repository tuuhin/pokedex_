import 'package:flutter/material.dart';

import '../../../core/data/pokemon_type/pokemon_type.dart';
import '../../domain/models/pokemon_move_detail_model.dart';

class MoveSummary extends StatelessWidget {
  final PokemonMoveDetailed details;
  const MoveSummary({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    final Color secondaryColor =
        PokeMonType.getPokeMonTypeByName(details.moveType).secondaryColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: 'Flavour: ',
                  style: TextStyle(
                      color: secondaryColor, fontWeight: FontWeight.w600)),
              TextSpan(
                text: details.flavourText.first.text,
              )
            ],
          ),
        ),
        const SizedBox(height: 2),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: 'Effect: ',
                  style: TextStyle(
                      color: secondaryColor, fontWeight: FontWeight.w600)),
              TextSpan(
                text: details.effect.first.effect,
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              )
            ],
          ),
        ),
        const SizedBox(height: 2),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: 'Damage Class: ',
                  style: TextStyle(
                      color: secondaryColor, fontWeight: FontWeight.w600)),
              TextSpan(
                  text: details.damageClass,
                  style: const TextStyle(overflow: TextOverflow.ellipsis))
            ],
          ),
        ),
      ],
    );
  }
}
