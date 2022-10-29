import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_type_charts/ui/widgets/pokemon_with_type.dart';
import 'package:flutter_pokedex/feature_type_charts/ui/widgets/widgets.dart';

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
    Color primaryColor =
        PokeMonType.getPokeMonTypeByName(details.name).primaryColor;
    Color secondaryColor =
        PokeMonType.getPokeMonTypeByName(details.name).secondaryColor;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Text(
              details.name,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: secondaryColor, fontWeight: FontWeight.w600),
            ),
            const Divider(),
            Text("blah blah"),
            DamageRelationCard(details: details.damgeRelation),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pokemons',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: secondaryColor, fontWeight: FontWeight.w600),
                )),
            PokemonWithTypes(pokemons: details.pokemons, color: secondaryColor)
          ],
        ),
      ),
    );
  }
}
