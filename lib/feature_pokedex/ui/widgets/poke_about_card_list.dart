import 'package:flutter/material.dart';

import './poke_about_cards.dart';

class PokeMonAboutCardList extends StatelessWidget {
  const PokeMonAboutCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 2.8,
        ),
        children: const [
          PokeMonAboutCards(aboutText: 'PokeDex', color: Colors.green),
          PokeMonAboutCards(aboutText: 'Moves', color: Colors.redAccent),
          PokeMonAboutCards(aboutText: 'Ability', color: Colors.blueAccent),
          PokeMonAboutCards(aboutText: 'Item', color: Colors.orangeAccent),
          PokeMonAboutCards(aboutText: 'Location', color: Colors.deepPurple),
          PokeMonAboutCards(aboutText: 'Type Charts', color: Colors.brown),
        ],
      ),
    );
  }
}
