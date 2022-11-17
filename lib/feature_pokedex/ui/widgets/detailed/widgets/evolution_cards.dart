import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../domain/models/models.dart';

class EvolutionCards extends StatelessWidget {
  final EvolutionChain chain;
  const EvolutionCards({
    Key? key,
    required this.chain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                if (chain.fromSpeciesURL != null)
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 100,
                    decoration: const BoxDecoration(
                        color: Colors.white10, shape: BoxShape.circle),
                    child: CachedNetworkImage(imageUrl: chain.fromSpeciesURL!),
                  ),
                const SizedBox(height: 10),
                Text(chain.fromSpecies,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontWeight: FontWeight.w600)),
              ],
            ),
            Column(
              children: [
                Text(chain.details.triggerName),
                const Divider(height: 2),
                const Icon(Icons.arrow_forward_rounded),
                if (chain.details.minLevel != null)
                  Text(chain.details.minLevel.toString()),
                if (chain.details.heldItemName != null)
                  Text(chain.details.heldItemName.toString()),
                if (chain.details.itemName != null)
                  Text(chain.details.itemName.toString()),
                if (chain.details.location != null)
                  Text(chain.details.location.toString()),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 100,
                  decoration: const BoxDecoration(
                      color: Colors.white10, shape: BoxShape.circle),
                  child: CachedNetworkImage(imageUrl: chain.toSpeciesURL),
                ),
                const SizedBox(height: 10),
                Text(chain.toSpecies,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontWeight: FontWeight.w600)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
