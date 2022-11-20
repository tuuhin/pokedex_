import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../context/providers.dart';
import '../../widgets.dart';

class PokemonEvolutionTab extends ConsumerWidget {
  final int pokemonId;
  const PokemonEvolutionTab({Key? key, required this.pokemonId})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(evolutionChainProvider(33)).when(
            data: (data) => PokemonEvolutionData(data: data.chain),
            loading: () => Text("loading"),
            error: (error, stackTrace) => Text("err"),
          );
}
