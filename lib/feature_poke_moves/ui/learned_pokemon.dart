import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../domain/domain.dart';

class StackedAvatars extends StatelessWidget {
  final List<LearnedByPokemon> pokemon;
  final Color color;
  const StackedAvatars({super.key, required this.pokemon, required this.color});

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
      height: 100,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => CachedNetworkImage(
                      imageUrl: pokemon[index].imageURL!,
                      errorWidget: (context, url, error) =>
                          const SizedBox.shrink(),
                    ),
                childCount: _childcount),
          ),
          ...[
            if (pokemon.length > 10)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      width: 60,
                      decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          border: Border.all(
                            color: color.withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text('${pokemon.length - _childcount}+',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      color: color,
                                      fontWeight: FontWeight.w600)))),
                ),
              )
          ]
        ],
      ),
    );
  }
}
