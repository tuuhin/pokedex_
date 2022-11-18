import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widget/blurry_appbar.dart';
import '../context/providers.dart';
import './widgets/widgets.dart';

class PokedexBaseRoute extends ConsumerStatefulWidget {
  const PokedexBaseRoute({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokedexBaseRouteState();
}

class _PokedexBaseRouteState extends ConsumerState<PokedexBaseRoute> {
  late ScrollController _controller;

  void loadMore() {
    double delta = MediaQuery.of(context).size.height * .2;
    if (_controller.position.maxScrollExtent - _controller.position.pixels <=
        delta) {
      ref.read(pokedexPokemonProvider.notifier).requestMore();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(loadMore);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _colCount(BoxConstraints constraints) {
    if (constraints.maxWidth > 600) {
      return 6;
    } else {
      return 2;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Scrollbar(
          controller: _controller,
          child: SafeArea(
            child: LayoutBuilder(builder: (context, constraints) {
              return CustomScrollView(
                controller: _controller,
                slivers: [
                  const SliverAppBar(),
                  SliverPersistentHeader(
                      floating: true, delegate: BlurryAppBar(title: "Pokemon")),
                  PokeDexPokemonLoader(colCount: _colCount(constraints)),
                  const PokeDexPokemonLoadMore()
                ],
              );
            }),
          ),
        ),
      );
}
