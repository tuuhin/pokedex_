import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './widgets/widgets.dart';

class PokemonTypeCharts extends ConsumerStatefulWidget {
  const PokemonTypeCharts({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokemonTypeChartsState();
}

class _PokemonTypeChartsState extends ConsumerState<PokemonTypeCharts> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        controller: _scrollController,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: const [
            SliverAppBar(title: Text('Types')),
            TypeChartsLoader(),
            TypeChartsLoadMore()
          ],
        ),
      ),
    );
  }
}
