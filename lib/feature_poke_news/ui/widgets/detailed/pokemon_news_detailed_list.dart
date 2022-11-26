import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widget/transitions.dart';
import '../../../context/providers.dart';
import '../../../domain/domain.dart';
import '../widgets.dart';

class PokemonNewsDetailedList extends ConsumerWidget {
  final List<PokemonNewsModel> news;
  const PokemonNewsDetailedList(this.news, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => SliverAnimatedList(
        key: ref.read(pokeNewsProviderPaginated.notifier).newsStateKey,
        itemBuilder: (context, index, animation) => LoadTransition(
            animation: animation,
            child: PokeNewsDetailedCard(news: news[index])),
      );
}
