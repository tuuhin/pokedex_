import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_poke_item/context/providers.dart';
import 'package:flutter_pokedex/feature_poke_item/ui/widget/pokemon_items_loader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widget/pokemon_item_load_more.dart';

class PokemonItems extends ConsumerStatefulWidget {
  const PokemonItems({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokemonItemsState();
}

class _PokemonItemsState extends ConsumerState<PokemonItems> {
  late final ScrollController _controller;

  void scrollCallback() {
    double delta = MediaQuery.of(context).size.height * .2;
    if (_controller.position.maxScrollExtent - _controller.position.pixels <=
        delta) {
      ref.read(pokemonItemProvider.notifier).fetchMore();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(scrollCallback);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        int itemCount = ref.read(pokemonItemProvider.notifier).itemCount;
        GlobalKey<SliverAnimatedListState> key =
            ref.read(pokemonItemProvider.notifier).key;
        for (var i = 0; i < itemCount; i++) {
          await Future.delayed(const Duration(milliseconds: 200),
              () => key.currentState?.insertItem(i));
        }
      },
    );
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
            PokemonItemsLoader(),
            PokemonItemLoadMore()
          ],
        ),
      ),
    );
  }
}
