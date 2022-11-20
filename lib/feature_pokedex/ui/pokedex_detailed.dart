import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/util/string_helper.dart';
import 'package:flutter_pokedex/feature_pokedex/domain/models/models.dart';

import '../../core/data/pokemon_type/pokemon_type.dart';
import 'widgets/widgets.dart';

class PokedexDetailed extends StatelessWidget {
  final PokedexPokemonModel data;
  const PokedexDetailed({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    PokeMonType type =
        PokeMonType.getPokeMonTypeByName(data.simple.types.first);
    return Title(
      title: data.simple.name.toTitleCase(),
      color: type.primaryColor,
      child: Scaffold(
        backgroundColor: type.primaryColor,
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(pinned: true),
            SliverPersistentHeader(
                delegate: PokemonDetailsHeader(height: size.height * .4)),
            PokemonDetailsTab(model: data)
          ],
        ),
      ),
    );
  }
}
