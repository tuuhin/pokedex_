import 'package:flutter/material.dart';
import 'package:flutter_pokedex/main.dart';

import '../../../data/dto/pokenews_dto.dart';
import 'poke_news_summary_card.dart';

class PokeNewsSummaryList extends StatelessWidget {
  final List<PokeNewsDto> data;
  const PokeNewsSummaryList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2, crossAxisCount: 1),
      itemCount: data.length,
      itemBuilder: (context, idx) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: PokeNewsSummary(news: data[idx]),
      ),
    );
  }
}
