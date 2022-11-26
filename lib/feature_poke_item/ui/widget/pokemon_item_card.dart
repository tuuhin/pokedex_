import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/util/utlis.dart';

import '../../domain/models/pokemon_item_model.dart';
import 'widget.dart';

class PokemonItemCard extends StatelessWidget {
  final PokemonItemModel item;
  final int index;
  const PokemonItemCard({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  decoratedId(index + 1),
                  style: const TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
                ),
                Text(
                  item.name,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                CachedNetworkImage(
                  height: 30,
                  width: 30,
                  placeholder: (context, url) => Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  imageUrl: item.imageUrl,
                ),
              ],
            ),
            const Divider(),
            if (item.effects.isNotEmpty)
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Effect: ',
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              fontWeight: FontWeight.w600,
                            )),
                    TextSpan(
                        text: item.effects.first.effect,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                        ))
                  ],
                ),
              ),
            if (item.flavorEntries.isNotEmpty)
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Flavor Text: ',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                        text: item.flavorEntries.first.text,
                        style: const TextStyle(overflow: TextOverflow.ellipsis))
                  ],
                ),
              ),
            PokemonItemCardExtra(item: item),
            Text(
              'Attributes',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Divider(),
            Wrap(
              children: item.attributes
                  .map<Chip>(
                    (attrs) => Chip(
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      avatar: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Color(0xffffce4b),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffffce4b),
                              offset: Offset.zero,
                              blurRadius: 3,
                            )
                          ],
                        ),
                      ),
                      label: Text(
                        attrs,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
