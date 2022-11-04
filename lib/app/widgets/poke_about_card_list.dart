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
          mainAxisSpacing: 15,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 2.8,
        ),
        children: [
          PokeMonAboutCards(
            aboutText: 'PokeDex',
            color: const Color(0xff4fc1a6),
            onTap: openPokeDexRoute,
          ),
          PokeMonAboutCards(
            aboutText: 'Moves',
            color: const Color(0xfff7776a),
            onTap: openMovesRoute,
          ),
          PokeMonAboutCards(
            aboutText: 'Ability',
            color: const Color(0xff58a9f4),
            onTap: openAbilityRoute,
          ),
          PokeMonAboutCards(
            aboutText: 'Item',
            color: const Color(0xffffce4b),
            onTap: openItemRoute,
          ),
          PokeMonAboutCards(
            aboutText: 'Location',
            color: const Color(0xff7c528c),
            onTap: openLocationRoute,
          ),
          PokeMonAboutCards(
            aboutText: 'Type Charts',
            color: const Color(0xffb1736d),
            onTap: openTypeRoute,
          ),
        ],
      ),
    );
  }
}
