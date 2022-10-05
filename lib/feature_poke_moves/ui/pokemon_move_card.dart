import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_poke_moves/ui/ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

import '../domain/domain.dart';
import '../../core/pokemon/pokemon_type/pokemon_type.dart';
import '../../core/util/utlis.dart';

class PokeMonMoveCard extends ConsumerWidget {
  final PokemonMoveDetailed details;
  const PokeMonMoveCard({
    Key? key,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color primaryColor =
        PokeMonType.getPokeMonTypeByName(details.moveType).primaryColor;
    Color secondaryColor =
        PokeMonType.getPokeMonTypeByName(details.moveType).secondaryColor;
    return Card(
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(details.name,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily)),
            ),
            Divider(color: secondaryColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(flex: 4, child: MoveSummary(details: details)),
                Flexible(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.1),
                        border: Border.all(
                          color: secondaryColor.withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: CachedNetworkImage(
                      imageUrl: details.learnedByPokemon.first.imageURL!,
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
                    color: secondaryColor, fontWeight: FontWeight.w600)),
            StackedAvatars(
              color: secondaryColor,
              pokemon: details.learnedByPokemon
                  .sublist(2)
                  .where(
                      (pokemon) => (getIdFromString(pokemon.url) ?? 1) < 1000)
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
