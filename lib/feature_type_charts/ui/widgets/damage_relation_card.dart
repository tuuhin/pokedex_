import 'package:flutter/material.dart';

import '../../domain/models/models.dart';

class DamageRelationCard extends StatelessWidget {
  final PokemonDamgeRelationModel details;
  const DamageRelationCard({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white12, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              children: [Text("")],
            )
          ],
        ),
      ),
    );
  }
}
