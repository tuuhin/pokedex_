import 'package:flutter/cupertino.dart';

import '../../../domain/models/pokedex_model.dart';
import '../widgets.dart';

class PokemonGridEntry extends StatelessWidget {
  final List<PokedexPokemonModel> data;
  const PokemonGridEntry({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) => PokedexSimplifiedEntry(
            model: data[index],
          ),
          childCount: data.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          crossAxisCount: 2,
          childAspectRatio: 1.25,
        ),
      );
}
