import 'package:flutter/material.dart';

import '../../../../domain/models/models.dart';
import '../widgets/pokedex_move_tile.dart';

class PokemonMovesTab extends StatelessWidget {
  final List<PokedexMoveModel> moves;
  const PokemonMovesTab({Key? key, required this.moves}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Moves', style: TextStyle(fontWeight: FontWeight.w700)),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: moves.length,
            itemBuilder: (context, index) =>
                PokedexMoveTile(model: moves[index]),
          ),
        ),
      ],
    );
  }
}
