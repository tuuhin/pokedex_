import 'package:flutter/material.dart';

class PokemonMoveStatsBar extends StatelessWidget {
  final String name;
  final int? value;
  final Color secondaryColor;

  const PokemonMoveStatsBar(
      {Key? key, required this.name, this.value, required this.secondaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 2,
              child: SizedBox(
                  width: 80, child: Text(name, textAlign: TextAlign.left))),
          Flexible(
            child: (value != null)
                ? Text(value!.toInt().toString())
                : const Text('Unknown'),
          ),
          Flexible(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: value == null ? 0 : value! / 100,
                color: secondaryColor,
                backgroundColor: secondaryColor.withOpacity(0.65),
                // semanticsLabel: widget.statsModel.name,
                minHeight: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
