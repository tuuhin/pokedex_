import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widget/transitions.dart';
import '../../context/provider.dart';
import '../../domain/models/pokemon_ability_model.dart';
import '../ui.dart';

class PokemonAbilityList extends ConsumerWidget {
  final List<PokemonAbility> ability;
  const PokemonAbilityList({Key? key, required this.ability}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => SliverAnimatedList(
        key: ref.read(pokemonAbilityProvider.notifier).key,
        itemBuilder: (context, index, animation) => LoadTransition(
            animation: animation,
            child: PokemonAbilityCard(ability: ability[index])),
      );
}
