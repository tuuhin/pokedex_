import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_type_charts/domain/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widget/transitions.dart';
import '../../context/provider.dart';
import 'widgets.dart';

class TypesList extends ConsumerWidget {
  final List<PokemonTypeDetailedModel> data;
  const TypesList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => SliverAnimatedList(
        key: ref.read(typeChartsProvider.notifier).listKey,
        itemBuilder: (context, index, animation) => LoadTransition(
          animation: animation,
          child: PokemonTypeChartsCard(
            details: data[index],
          ),
        ),
      );
}
