import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widget/core_widgets.dart';
import '../context/providers.dart';
import 'widgets/widgets.dart';

class PokedexDetailedLoader extends ConsumerWidget {
  final int pokemonId;

  const PokedexDetailedLoader({Key? key, required this.pokemonId})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(currentSelectedPokemon(pokemonId)).when(
            data: (data) => PokedexDetailed(data: data),
            error: (Object error, StackTrace stackTrace) =>
                const PaginatorErrorWidget(),
            loading: () => Center(child: CircularProgressIndicator()),
          );
}
