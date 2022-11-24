import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../context/providers.dart';
import '../../../../domain/models/models.dart';
import '../../widgets.dart';

class PokemonAboutTab extends ConsumerWidget {
  final int pokeId;
  const PokemonAboutTab({Key? key, required this.pokeId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => ref
      .watch<AsyncValue<PokemonSpeciesModel>>(pokemonSpeciesProvider(pokeId))
      .when(
          data: (data) => SpeciesData(data: data, pokeId: pokeId),
          error: (err, stk) => Text('erre '),
          loading: (() => Text('loading')));
}
