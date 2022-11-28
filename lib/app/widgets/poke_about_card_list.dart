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
    return GridView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 15,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: 2.5,
      ),
      children: [
        PokeMonAboutCards(
          title: 'PokeDex',
          color: const Color(0xff4fc1a6),
          onTap: openPokeDexRoute,
        ),
        PokeMonAboutCards(
          title: 'Moves',
          color: const Color(0xfff7776a),
          onTap: openMovesRoute,
        ),
        PokeMonAboutCards(
          title: 'Ability',
          color: const Color(0xff58a9f4),
          onTap: openAbilityRoute,
        ),
        PokeMonAboutCards(
          title: 'Item',
          color: const Color(0xffffce4b),
          onTap: openItemRoute,
        ),
        PokeMonAboutCards(
          title: 'Location',
          color: const Color(0xff7c528c),
          onTap: openLocationRoute,
        ),
        PokeMonAboutCards(
          title: 'Type Charts',
          color: const Color(0xffb1736d),
          onTap: openTypeRoute,
        ),
      ],
    );
  }
}
