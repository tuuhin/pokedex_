import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import './poke_about_cards.dart';

class PokeMonAboutCardList extends StatefulWidget {
  const PokeMonAboutCardList({super.key});

  @override
  State<PokeMonAboutCardList> createState() => _PokeMonAboutCardListState();
}

class _PokeMonAboutCardListState extends State<PokeMonAboutCardList> {
  void openMovesRoute() => context.push('/moves');
  void openPokeDexRoute() => context.push("/pokedex");
  void openAbilityRoute() => context.push('/ability');
  void openItemRoute() => context.push('/item');
  void openLocationRoute() => context.push('/location');
  void openTypeRoute() => context.push('/type');

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
        children: [
          PokeMonAboutCards(
            aboutText: 'PokeDex',
            color: Colors.green,
            onTap: openPokeDexRoute,
          ),
          PokeMonAboutCards(
            aboutText: 'Moves',
            color: Colors.redAccent,
            onTap: openMovesRoute,
          ),
          PokeMonAboutCards(
            aboutText: 'Ability',
            color: Colors.blueAccent,
            onTap: openAbilityRoute,
          ),
          PokeMonAboutCards(
            aboutText: 'Item',
            color: Colors.orangeAccent,
            onTap: openItemRoute,
          ),
          PokeMonAboutCards(
            aboutText: 'Location',
            color: Colors.deepPurple,
            onTap: openLocationRoute,
          ),
          PokeMonAboutCards(
              aboutText: 'Type Charts',
              color: Colors.brown,
              onTap: openTypeRoute),
        ],
      ),
    );
  }
}
