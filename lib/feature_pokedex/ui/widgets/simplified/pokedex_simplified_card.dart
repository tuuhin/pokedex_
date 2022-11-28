import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/util/string_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
              color: pokemonType.secondaryColor.withOpacity(0.6),
              offset: const Offset(0, 5),
              blurRadius: 8,
              spreadRadius: 2)
        ],
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Positioned(
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Text(
                decoratedId(model.pokemonId),
                style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -10,
            right: -10,
            child: Image.asset("assets/icons/poke_ball.png",
                color: Colors.white24, scale: 8),
          ),
          Hero(
            tag: model.imageUrl,
            child: CachedNetworkImage(
              filterQuality: FilterQuality.low,
              imageUrl: model.imageUrl,
              height: size.height * .125,
              width: size.height * .125,
              errorWidget: (context, url, error) => const SizedBox.shrink(),
              progressIndicatorBuilder: (context, url, progress) => Container(
                decoration: BoxDecoration(
                  color: pokemonType.secondaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: CircularProgressIndicator(
                    color: pokemonType.secondaryColor.withOpacity(0.25),
                    value: progress.progress,
                  ),
                ),
              ),
              // placeholder: (context, url) => Container(
              //   decoration: BoxDecoration(
              //     color: pokemonType.secondaryColor.withOpacity(0.2),
              //     borderRadius:
              //         const BorderRadius.only(bottomRight: Radius.circular(10)),
              //   ),
              // ),
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
                              color:
                                  pokemonType.secondaryColor.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              type.toTitleCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white54,
                              ),
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
