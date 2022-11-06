import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './widgets/widgets.dart';

class PokedexBaseRoute extends ConsumerStatefulWidget {
  const PokedexBaseRoute({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokedexBaseRouteState();
}

class _PokedexBaseRouteState extends ConsumerState<PokedexBaseRoute> {
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
    return Scaffold(
      body: Scrollbar(
        controller: _controller,
        child: CustomScrollView(
          controller: _controller,
          slivers: const [
            SliverAppBar(
              title: Text('Pokemon'),
            ),
            PokeDexPokemonLoader(),
            PokeDexPokemonLoadMore()
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.small(
      //   onPressed: () {},
      //   child: Icon(Icons.menu),
      // ),
    );
  }
}
