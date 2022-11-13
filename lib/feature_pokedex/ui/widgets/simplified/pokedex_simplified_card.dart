import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/util/string_helper.dart';

import '../../../../core/data/pokemon_type/pokemon_type.dart';
import '../../../domain/models/pokemon_simplified_model.dart';

class PokedexSimplifiedCard extends StatelessWidget {
  final PokedexPokemonSimplifiedModel model;
  const PokedexSimplifiedCard({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokeMonType pokemonType =
        PokeMonType.getPokeMonTypeByName(model.types.first);

    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: pokemonType.primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: pokemonType.secondaryColor.withOpacity(0.4),
                offset: const Offset(0, 5),
                blurRadius: 5,
                spreadRadius: 2)
          ]),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Positioned(
            bottom: -10,
            right: -10,
            child: Image.asset(
              "assets/icons/poke_ball.png",
              color: Colors.white24,
              scale: 8,
            ),
          ),
          CachedNetworkImage(
            imageUrl: model.imageUrl,
            height: size.height * .125,
            errorWidget: (context, url, error) => const SizedBox.shrink(),
            placeholder: (context, url) => Container(
              decoration: BoxDecoration(
                color: pokemonType.secondaryColor.withOpacity(0.5),
                border: Border.all(color: pokemonType.secondaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.name.toTitleCase(),
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                          color: Colors.white70)),
                  const SizedBox(height: 10),
                  ...model.types
                      .map(
                        (type) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              type,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white54),
                            ),
                          ),
                        ),
                      )
                      .toList()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
