import 'package:flutter/material.dart';

import '../../../../domain/models/models.dart';

class PokedexMoveTile extends StatelessWidget {
  final PokedexMoveModel model;
  const PokedexMoveTile({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Set<String> methods = model.moveLearnMethod.toSet();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.moveName,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            const Text('Learned By'),
            Row(
              children: methods
                  .map((e) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Chip(label: Text(e))))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
