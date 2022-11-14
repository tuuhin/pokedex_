import 'package:flutter/material.dart';
import '../../../domain/domain.dart';
import 'poke_news_summary_card.dart';

class PokeNewsSummaryList extends StatefulWidget {
  final List<PokemonNewsModel> data;

  const PokeNewsSummaryList({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<PokeNewsSummaryList> createState() => _PokeNewsSummaryListState();
}

class _PokeNewsSummaryListState extends State<PokeNewsSummaryList> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _controller,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: GridView.builder(
            controller: _controller,
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2,
              crossAxisCount: 1,
            ),
            itemCount: widget.data.length,
            itemBuilder: (context, idx) =>
                PokeNewsSummary(news: widget.data[idx]),
          ),
        ),
      ),
    );
  }
}
