import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widget/transitions.dart';
import '../../context/providers.dart';
import '../../domain/models/pokemon_item_model.dart';
import 'pokemon_item_card.dart';

class PokemonItemList extends ConsumerWidget {
  final List<PokemonItemModel> data;
  const PokemonItemList(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => SliverAnimatedList(
        key: ref.read(pokemonItemProvider.notifier).key,
        itemBuilder: (context, index, animation) => LoadTransition(
            animation: animation,
            child: PokemonItemCard(
              item: data[index],
              index: index,
            )),
      );
}
