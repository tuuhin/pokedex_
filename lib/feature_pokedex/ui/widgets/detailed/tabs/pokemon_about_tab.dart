import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../context/providers.dart';
import '../../widgets.dart';

class PokemonAboutTab extends StatelessWidget {
  const PokemonAboutTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return ref
          .watch(pokemonSpeciesProvider(
              ref.read(currentDetailedPokemon).pokemon.id))
          .when(
              data: (data) => SpeciesData(data: data),
              error: (err, stk) => Text('erre '),
              loading: (() => Text('loading')));
    });
  }
}
