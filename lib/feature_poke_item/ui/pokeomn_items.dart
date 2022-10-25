import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widget/pokemon_item_load_more.dart';

class PokemonItems extends ConsumerStatefulWidget {
  const PokemonItems({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokemonItemsState();
}

class _PokemonItemsState extends ConsumerState<PokemonItems> {
  late final ScrollController _controller;

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
              title: Text('PokemonItems'),
              floating: true,
            ),
            PokemonItemLoadMore()
          ],
        ),
      ),
    );
  }
}
