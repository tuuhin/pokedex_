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

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Title(
          title: 'PokeDex',
          color: const Color(0xff4fc1a6),
          child: Scrollbar(
            controller: _controller,
            child: SafeArea(
              child: CustomScrollView(
                controller: _controller,
                slivers: [
                  const SliverAppBar(),
                  SliverPersistentHeader(
                      floating: true, delegate: BlurryAppBar(title: "Pokemon")),
                  const PokeDexPokemonLoader(),
                  const PokeDexPokemonLoadMore()
                ],
              ),
            ),
          ),
        ),
      );
}
