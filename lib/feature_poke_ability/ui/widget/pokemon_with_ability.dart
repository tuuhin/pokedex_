import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/models/pokemon_with_ability_model.dart';

class PokemonWithAbilityScrollView extends StatelessWidget {
  final List<PokemonWithAbility> pokemon;
  const PokemonWithAbilityScrollView({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => SizedBox(
                width: 100,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CachedNetworkImage(
                      height: 100,
                      imageUrl: pokemon[index].pokemon.imageUrl!,
                      placeholder: (context, url) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.black26.withOpacity(0.1),
                              border: Border.all(
                                color: Colors.black26.withOpacity(0.5),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      errorWidget: (context, url, error) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.black26.withOpacity(0.1),
                              border: Border.all(
                                color: Colors.black26.withOpacity(0.5),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              'No Image',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(pokemon[index].pokemon.name,
                        style: Theme.of(context).textTheme.bodyText2)
                  ],
                ),
              ),
              childCount: pokemon.length,
            ),
          ),
        ],
      ),
    );
  }
}
