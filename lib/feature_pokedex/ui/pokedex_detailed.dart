import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_pokedex/domain/models/models.dart';
import 'package:flutter_pokedex/feature_pokedex/ui/widgets/widgets.dart';

import '../../core/data/pokemon_type/pokemon_type.dart';

class PokedexDetailed extends StatelessWidget {
  final int pokemonId;
  final PokedexPokemonModel model;
  const PokedexDetailed({
    Key? key,
    required this.model,
    required this.pokemonId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokeMonType type =
        PokeMonType.getPokeMonTypeByName(model.simple.types.first);

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: type.primaryColor,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(),
          SliverPersistentHeader(
              delegate: PokemonDetailsHeader(height: size.height * .4)),
          PokemonDetailsTab(model: model)
        ],
      ),
    );
  }
}
