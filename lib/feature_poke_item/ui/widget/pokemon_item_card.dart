import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/models/pokemon_item_model.dart';

part './pokemon_item_card_extra.dart';

class PokemonItemCard extends StatelessWidget {
  final PokemonItemModel item;
  const PokemonItemCard({super.key, required this.item});

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
                Text(item.name,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontWeight: FontWeight.w600)),
                CachedNetworkImage(
                  placeholder: (context, url) =>
                      const SizedBox.square(dimension: 15),
                  imageUrl: item.imageUrl,
                ),
              ],
            ),
            const Divider(),
            ...[
              if (item.effects.isNotEmpty)
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'Effect: ',
                          style:
                              Theme.of(context).textTheme.subtitle1?.copyWith(
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
            ],
            ...[
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
                          style:
                              const TextStyle(overflow: TextOverflow.ellipsis))
                    ],
                  ),
                ),
            ],
            PokemonItemCardExtra(item: item),
            Text('Attributes', style: Theme.of(context).textTheme.subtitle1),
            const Divider(),
            Wrap(
              children: item.attributes
                  .map((e) => Chip(
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                        avatar: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                              color: Colors.redAccent,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.redAccent,
                                    offset: Offset.zero,
                                    blurRadius: 10),
                                BoxShadow(
                                    color: Colors.redAccent,
                                    offset: Offset.zero,
                                    blurRadius: 5)
                              ]),
                        ),
                        label: Text(e),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
