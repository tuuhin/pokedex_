import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_type_charts/ui/widgets/pokemon_with_type.dart';
import 'package:flutter_pokedex/feature_type_charts/ui/widgets/widgets.dart';
import 'package:flutter_pokedex/main.dart';

import '../../../core/data/pokemon_type/pokemon_type.dart';
import '../../domain/models/pokemon_types_detailed_model.dart';

class PokemonTypeChartsCard extends StatelessWidget {
  final PokemonTypeDetailedModel details;
  const PokemonTypeChartsCard({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    logger.fine("ehy");
    Color primaryColor =
        PokeMonType.getPokeMonTypeByName(details.name).primaryColor;
    Color secondaryColor =
        PokeMonType.getPokeMonTypeByName(details.name).secondaryColor;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border.all(color: secondaryColor),
            color: primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Text(
              details.name,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: secondaryColor, fontWeight: FontWeight.w600),
            ),
            Divider(color: secondaryColor),
            Padding(
              padding: const EdgeInsets.only(bottom: 2.0, right: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Damage Relation',
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: secondaryColor, fontWeight: FontWeight.w600),
                  ),
                  if (details.moveDamageClass != null)
                    Chip(
                      label: Text(details.moveDamageClass!,
                          style: TextStyle(
                              color: secondaryColor,
                              fontWeight: FontWeight.w600)),
                      padding: EdgeInsets.zero,
                      backgroundColor: primaryColor.withOpacity(0.8),
                      side: BorderSide(color: secondaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    )
                ],
              ),
            ),
            DamageRelationCard(
                details: details.damgeRelation, name: details.name),
            if (details.moves.isNotEmpty)
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Moves',
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: secondaryColor, fontWeight: FontWeight.w600)),
              ),
            if (details.moves.isNotEmpty)
              TypeChartsMove(moves: details.moves, name: details.name),
            if (details.pokemons.isNotEmpty)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pokemons',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: secondaryColor, fontWeight: FontWeight.w600),
                ),
              ),
            if (details.pokemons.isNotEmpty)
              PokemonWithTypes(
                  pokemons: details.pokemons, color: secondaryColor)
          ],
        ),
      ),
    );
  }
}
