import 'package:flutter/material.dart';

import '../../../core/data/pokemon_type/pokemon_type.dart';
import '../../domain/models/models.dart';

class DamageRelationCard extends StatelessWidget {
  final PokemonDamgeRelationModel details;
  final String name;
  const DamageRelationCard({
    super.key,
    required this.details,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Map<String, List<String>> damageMap = {
      "Double Damage From": details.doubleDamageFrom,
      "Double Damage To": details.doubleDamageTo,
      "No Damage To": details.noDamageTo,
      "No Damage From": details.noDamageFrom
    };
    final Color backgroundColor =
        PokeMonType.getPokeMonTypeByName(name).primaryColor;
    final Color color = PokeMonType.getPokeMonTypeByName(name).secondaryColor;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: damageMap
              .map((key, relation) {
                return MapEntry(
                    key,
                    SizedBox(
                      height: 40,
                      child: Row(
                        children: [
                          Text(key,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: color)),
                          const VerticalDivider(color: Colors.transparent),
                          if (relation.isNotEmpty)
                            Expanded(
                              child: ListView.builder(
                                itemCount: relation.length,
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  Color primaryColor =
                                      PokeMonType.getPokeMonTypeByName(
                                              relation[index])
                                          .primaryColor;
                                  Color secondaryColor =
                                      PokeMonType.getPokeMonTypeByName(
                                              relation[index])
                                          .secondaryColor;
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Chip(
                                      backgroundColor:
                                          primaryColor.withOpacity(0.8),
                                      side: BorderSide(color: secondaryColor),
                                      label: Text(relation[index],
                                          style:
                                              TextStyle(color: secondaryColor)),
                                    ),
                                  );
                                },
                              ),
                            )
                          else
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Chip(
                                backgroundColor:
                                    backgroundColor.withOpacity(0.8),
                                side: BorderSide(color: color),
                                label: Text('None',
                                    style: TextStyle(color: color)),
                              ),
                            )
                        ],
                      ),
                    ));
              })
              .values
              .whereType<Widget>()
              .toList(),
        ),
      ),
    );
  }
}
