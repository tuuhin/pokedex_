import 'package:flutter/material.dart';

import '../../../core/data/pokemon_type/pokemon_type.dart';

class TypeChartsMove extends StatelessWidget {
  final List<String> moves;
  final String name;
  const TypeChartsMove({super.key, required this.moves, required this.name});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor =
        PokeMonType.getPokeMonTypeByName(name).primaryColor;
    final Color secondaryColor =
        PokeMonType.getPokeMonTypeByName(name).secondaryColor;
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moves.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Chip(
            avatar: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondaryColor.withOpacity(0.75)),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.w800),
                  ),
                )),
            label: Text(moves[index], style: TextStyle(color: secondaryColor)),
            backgroundColor: primaryColor.withOpacity(0.8),
            side: BorderSide(color: secondaryColor),
          ),
        ),
      ),
    );
  }
}
