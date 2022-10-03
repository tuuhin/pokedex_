import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_poke_moves/ui/pokemon_moves_loader.dart';

class PokeMonMoves extends StatefulWidget {
  const PokeMonMoves({super.key});

  @override
  State<PokeMonMoves> createState() => _PokeMonMovesState();
}

class _PokeMonMovesState extends State<PokeMonMoves> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Pokemon Moves'),
          ),
          PokeMovesLoader()
        ],
      ),
    );
  }
}
