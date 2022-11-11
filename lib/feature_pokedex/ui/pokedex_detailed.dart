import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/data/pokemon_type/pokemon_type.dart';
import 'package:flutter_pokedex/feature_pokedex/ui/widgets/widgets.dart';

class PokedexDetailed extends StatelessWidget {
  final int pokemonId;
  const PokedexDetailed({
    Key? key,
    required this.pokemonId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokeMonType type = PokeMonType.getPokeMonTypeById(pokemonId);

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: type.primaryColor,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(),
          SliverPersistentHeader(
              delegate: PokemonDetailsHeader(height: size.height * .4)),
          const PokemonDetailsTab()
        ],
      ),
    );
  }
}
