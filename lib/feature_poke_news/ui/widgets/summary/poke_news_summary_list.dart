import 'package:flutter/material.dart';
import '../../../domain/domain.dart';
import 'poke_news_summary_card.dart';

class PokeNewsSummaryList extends StatelessWidget {
  final List<PokemonNewsModel> data;
  const PokeNewsSummaryList({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2, crossAxisCount: 1),
      itemCount: data.length,
      itemBuilder: (context, idx) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        child: PokeNewsSummary(news: data[idx]),
      ),
    );
  }
}
