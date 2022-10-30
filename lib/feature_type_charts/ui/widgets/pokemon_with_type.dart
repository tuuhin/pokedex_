import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/models/base_pokemon_model.dart';

class PokemonWithTypes extends StatelessWidget {
  final List<BasePokemonModel> pokemons;
  final Color color;
  const PokemonWithTypes({
    super.key,
    required this.pokemons,
    required this.color,
  });

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
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    CachedNetworkImage(
                      height: 100,
                      imageUrl: pokemons[index].imageUrl!,
                      placeholder: (context, url) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 60,
                          decoration: BoxDecoration(
                              color: color.withOpacity(0.1),
                              border: Border.all(
                                color: color.withOpacity(0.5),
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
                              color: color.withOpacity(0.1),
                              border: Border.all(
                                color: color.withOpacity(0.5),
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
                    Text(
                      pokemons[index].name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: Colors.black38),
                    )
                  ],
                ),
              ),
              childCount: pokemons.length,
            ),
          ),
        ],
      ),
    );
  }
}
