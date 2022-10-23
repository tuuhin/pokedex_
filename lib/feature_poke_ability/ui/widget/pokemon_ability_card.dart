import 'package:flutter/material.dart';

import '../../domain/models/pokemon_ability.dart';
import '../ui.dart';

class PokemonAbilityCard extends StatelessWidget {
  final PokemonAbility ability;
  const PokemonAbilityCard({required this.ability, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                ability.name,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(),
            ...[
              if (ability.effectEntries.isNotEmpty)
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'Effect: ',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(fontWeight: FontWeight.w600)),
                      TextSpan(
                          text: ability.effectEntries.first.shortEffect,
                          style:
                              const TextStyle(overflow: TextOverflow.ellipsis))
                    ],
                  ),
                ),
            ],
            ...[
              if (ability.flavourText.isNotEmpty)
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Flavor Text: ',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                          text: ability.flavourText.first.text,
                          style:
                              const TextStyle(overflow: TextOverflow.ellipsis))
                    ],
                  ),
                ),
            ],
            ...[
              if (ability.pokemon.isNotEmpty) ...[
                const Divider(),
                Text(
                  'Pokemon with Ability (${ability.pokemon.length})',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                PokemonWithAbilityScrollView(pokemon: ability.pokemon)
              ]
            ]
          ],
        ),
      ),
    );
  }
}
