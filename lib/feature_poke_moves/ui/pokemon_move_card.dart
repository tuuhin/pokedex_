import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/util/string_helper.dart';
import 'package:flutter_pokedex/feature_poke_moves/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/pokemon/pokemon_type/pokemon_type.dart';

class PokeMonMoveCard extends ConsumerWidget {
  final PokemonMoveDetailed details;
  const PokeMonMoveCard({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color cardColor =
        PokeMonType.getPokeMonTypeByName(details.moveType).primaryColor;
    Color? textColor =
        PokeMonType.getPokeMonTypeByName(details.moveType).secondaryColor;
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(details.name,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: textColor)),

            ...details.flavourText.sublist(0, 10).map(
                  (e) => Text(removeSpecialChars(e.flavourText)),
                ),

            const Divider()
            // Text(details.)
          ],
        ),
      ),
    );
  }
}
