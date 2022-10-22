import 'package:flutter/material.dart';

class PokedexBaseRoute extends StatelessWidget {
  const PokedexBaseRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pokedex'),
      ),
    );
  }
}
