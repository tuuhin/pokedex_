import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_pokedex/ui/widgets/detailed/widgets/evolution_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../context/providers.dart';
import '../../widgets.dart';

class PokemonEvolutionTab extends ConsumerWidget {
  final int pokemonId;
  const PokemonEvolutionTab({Key? key, required this.pokemonId})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int? evId = ref.read(evolutionIdProvider.notifier).evId;
    return ref.watch(evolutionChainProvider(evId)).when(
          data: (data) => PokemonEvolutionData(data: data.chain),
          loading: () => const SizedBox.shrink(),
          error: (error, stackTrace) => const EvolutionError(),
          absent: (message) => ListTile(
            title: Text(message),
            subtitle: const Text('Blank nothing found'),
          ),
        );
  }
}
