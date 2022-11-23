import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/util/utlis.dart';
import 'package:flutter_pokedex/feature_pokedex/domain/models/models.dart';
import 'package:google_fonts/google_fonts.dart';

import 'rotating_flex_pokeball.dart';

class StyledPokedexAppBar extends SliverPersistentHeaderDelegate {
  final PokedexPokemonModel pokemon;
  final double height;

  StyledPokedexAppBar(this.pokemon, {required this.height});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: height,
      child: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -15,
              right: -30,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                opacity: shrinkOffset <= height * 0.4 ? 0 : 1,
                child: const RotatingFlexPokeBall(size: 6),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              left: shrinkOffset <= height * 0.4 ? 15 : null,
              top: shrinkOffset <= height * 0.4 ? 80 : kTextTabBarHeight - 10,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 500),
                style: TextStyle(
                    fontSize: shrinkOffset <= height * 0.4
                        ? Theme.of(context).textTheme.headline4?.fontSize
                        : Theme.of(context).textTheme.headline6?.fontSize),
                child: Text(pokemon.simple.name,
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 200,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: shrinkOffset <= height * 0.1 ? 1 : 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: pokemon.simple.types
                      .map(
                        (type) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              type.toTitleCase(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: shrinkOffset <= height * 0.3 ? 1 : 0,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  const Positioned(
                      bottom: 0, child: RotatingFlexPokeBall(size: 3.5)),
                  Positioned(
                    right: 20,
                    bottom: 220,
                    child: Text(decoratedId(pokemon.id),
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2)),
                  ),
                  Positioned(
                    bottom: -40,
                    child: Hero(
                      tag: '${pokemon.simple.imageUrl}',
                      child: CachedNetworkImage(
                        imageUrl: pokemon.simple.imageUrl,
                        height: 250,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => height;

  @override
  // TODO: implement minExtent
  double get minExtent => kTextTabBarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
