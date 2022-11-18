import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../domain/models/models.dart';

class PokemonBreadingData extends StatelessWidget {
  final PokemonSpeciesModel data;
  const PokemonBreadingData({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Breading',
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Gender",
                style: Theme.of(context).textTheme.caption?.copyWith(
                    color: Theme.of(context).textTheme.headline2?.color,
                    fontWeight: FontWeight.bold)),
            Flexible(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FaIcon(FontAwesomeIcons.mars,
                          size: 15, color: Colors.purple),
                      const SizedBox(width: 5),
                      Text('${data.maleCount.toString()} %'),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FaIcon(FontAwesomeIcons.venus,
                          size: 15, color: Colors.pink),
                      const SizedBox(width: 5),
                      Text('${data.femaleCount.toString()} %'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              'Egg Groups',
              style: Theme.of(context).textTheme.caption?.copyWith(
                  color: Theme.of(context).textTheme.headline2?.color,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 30),
            Flexible(
              flex: 3,
              child: Row(
                children: data.eggGroups
                    .map((e) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(e)))
                    .toList(),
              ),
            )
          ],
        )
      ],
    );
  }
}
