import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/pokemon/pokemon_type/pokemon_type.dart';
import 'package:flutter_pokedex/feature_poke_moves/domain/domain.dart';

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
            border: Border.all(
              color: secondaryColor.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
            height: 60,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Power: ',
                            style: TextStyle(
                              color: secondaryColor,
                            ),
                          ),
                          TextSpan(
                            text: details.power == null
                                ? 'Unknown'
                                : details.power.toString(),
                          )
                        ],
                      ),
                    ),
                    const VerticalDivider(),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Pp: ',
                              style: TextStyle(
                                color: secondaryColor,
                              )),
                          TextSpan(
                            text: details.pp.toString(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Accuracy: ',
                              style: TextStyle(
                                color: secondaryColor,
                              )),
                          TextSpan(
                            text: details.accuracy == null
                                ? 'Unknown'
                                : details.accuracy.toString(),
                          )
                        ],
                      ),
                    ),
                    const VerticalDivider(),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Priority: ',
                              style: TextStyle(
                                color: secondaryColor,
                              )),
                          TextSpan(
                            text: details.priority.toString(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
