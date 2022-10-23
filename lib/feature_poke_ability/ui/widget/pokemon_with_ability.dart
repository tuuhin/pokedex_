import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/models/pokemon_with_ability_model.dart';

class PokemonWithAbilityScrollView extends StatelessWidget {
  final List<PokemonWithAbility> pokemon;
  const PokemonWithAbilityScrollView({super.key, required this.pokemon});

  int get _childcount {
    if (pokemon.length < 10) {
      return pokemon.length;
    } else if (pokemon.length < 20) {
      return 10;
    } else if (pokemon.length < 30) {
      return 15;
    } else {
      return 20;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CachedNetworkImage(
                          imageUrl: pokemon[index].pokemon.imageUrl!,
                          fit: BoxFit.cover,
                          height: 100,
                          placeholder: (context, url) => Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              width: 60,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const SizedBox.shrink(),
                        ),
                        Text('(${pokemon[index].slots})')
                      ],
                    ),
                childCount: _childcount),
          ),
          ...[
            if (pokemon.length > 10)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 60,
                    child: Center(
                      child: Text(
                        '${pokemon.length - _childcount}+',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                ),
              )
          ]
        ],
      ),
    );
  }
}
