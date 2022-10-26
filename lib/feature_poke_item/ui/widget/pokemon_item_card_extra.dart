part of './pokemon_item_card.dart';

class PokemonItemCardExtra extends StatelessWidget {
  final PokemonItemModel item;
  const PokemonItemCardExtra({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Category: ',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                          text: item.category,
                          style:
                              const TextStyle(overflow: TextOverflow.ellipsis))
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Cost: ',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                          text: item.cost.toString(),
                          style:
                              const TextStyle(overflow: TextOverflow.ellipsis))
                    ],
                  ),
                ),
              ],
            ),
            ...[
              if (item.fillingEffect != null || item.fillingPower != null)
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Filling Effect: ',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                              text: item.fillingEffect!.toString(),
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis))
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Filling Power: ',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                              text: item.fillingPower!.toString(),
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis))
                        ],
                      ),
                    ),
                  ],
                )
            ]
          ],
        ),
      ),
    );
  }
}
