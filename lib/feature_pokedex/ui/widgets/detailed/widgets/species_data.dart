import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/models.dart';
import 'pokemon_breading_data.dart';

class SpeciesData extends ConsumerWidget {
  final PokemonSpeciesModel data;
  const SpeciesData({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final PokedexPokemonModel model = ref.read(currentDetailedPokemon).pokemon;
    // ref.read(currentSpecies).setPokemon(data);
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
          child: Text(
              data.flavorTextEntries.length > 3
                  ? data.flavorTextEntries.sublist(0, 2).fold('',
                      (previousValue, element) => previousValue + element.text)
                  : data.flavorTextEntries.first.text,
              style: Theme.of(context).textTheme.bodyText2),
        ),
        Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          borderOnForeground: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Height',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                          color: Theme.of(context).textTheme.headline3?.color,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Weight',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                          color: Theme.of(context).textTheme.headline3?.color,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Abilities',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                          color: Theme.of(context).textTheme.headline3?.color,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(width: 40),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text('${toFeet(model.height)} (${toMeters(model.height)})'),
                //     const SizedBox(height: 10),
                //     Text('${toLBS(model.weight)} (${toKg(model.weight)})'),
                //     const SizedBox(height: 10),
                //     Row(
                //         children:
                //             model.abilities.map((e) => Text('$e, ')).toList())
                //   ],
                // )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
          child: PokemonBreadingData(data: data),
        )
      ],
    );
  }
}
