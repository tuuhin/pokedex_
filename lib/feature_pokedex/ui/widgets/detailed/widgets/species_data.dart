import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/util/conversion.dart';
import 'package:flutter_pokedex/feature_pokedex/context/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/models.dart';
import 'pokemon_breading_data.dart';

class SpeciesData extends ConsumerWidget {
  final PokemonSpeciesModel data;
  const SpeciesData({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PokedexPokemonModel model = ref.read(currentDetailedPokemon).pokemon;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Text(data.flavorTextEntries.first.text),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).cardColor,
                boxShadow: [BoxShadow()]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Height'),
                      Text('Weight'),
                      Text('Abilities'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '${toFeet(model.height)} (${toMeters(model.height)})'),
                      Text('${toLBS(model.weight)} (${toKg(model.weight)})'),
                      Row(
                        children:
                            model.abilities.map((e) => Text('$e,')).toList(),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: PokemonBreadingData(data: data),
          )
        ],
      ),
    );
  }
}
