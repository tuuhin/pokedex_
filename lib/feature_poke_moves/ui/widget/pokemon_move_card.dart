import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/data/pokemon_type/pokemon_type.dart';
import '../../../core/util/string_helper.dart';
import '../../domain/domain.dart';
import '../ui.dart';

class PokeMonMoveCard extends ConsumerWidget {
  final PokemonMoveDetailed details;
  const PokeMonMoveCard({
    Key? key,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PokeMonType pokemonType =
        PokeMonType.getPokeMonTypeByName(details.moveType);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: pokemonType.primaryColor,
            border: Border.all(color: pokemonType.secondaryColor, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  flex: 8,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(details.name,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: pokemonType.secondaryColor,
                            fontWeight: FontWeight.w800)),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    decoratedId(details.id),
                    style: TextStyle(
                        color: pokemonType.secondaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            Divider(color: pokemonType.secondaryColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(flex: 4, child: MoveSummary(details: details)),
                Flexible(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: pokemonType.secondaryColor.withOpacity(0.1),
                        border: Border.all(
                          color: pokemonType.secondaryColor.withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: CachedNetworkImage(
                      imageUrl: details.learnedByPokemon.first.imageUrl!,
                      errorWidget: (context, url, error) =>
                          const SizedBox.shrink(),
                    ),
                  ),
                ),
              ],
            ),
            PokemonMoveStats(details: details),
            Text('Learned by:',
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: pokemonType.secondaryColor,
                    fontWeight: FontWeight.w600)),
            LeanedByPokemon(
              color: pokemonType.secondaryColor,
              pokemons: details.learnedByPokemon.sublist(1).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
