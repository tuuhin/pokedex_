import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_type_charts/context/provider.dart';
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

  void _scrollCallBack() {
    double delta = MediaQuery.of(context).size.height * .2;
    if (_scrollController.position.maxScrollExtent -
            _scrollController.position.pixels <=
        delta) {
      ref.read(pokemonTypeChartsProvider.notifier).requestMore();
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollCallBack);
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
