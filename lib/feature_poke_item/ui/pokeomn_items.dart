import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widget/blurry_appbar.dart';
import '../context/providers.dart';
import 'widget/widget.dart';

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

  void _postCallBack(Duration _) async {
    int itemCount = ref.read(pokemonItemProvider.notifier).itemCount;
    GlobalKey<SliverAnimatedListState> key =
        ref.read(pokemonItemProvider.notifier).key;
    for (var i = 0; i < itemCount; i++) {
      await Future.delayed(const Duration(milliseconds: 200),
          () => key.currentState?.insertItem(i));
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(scrollCallback);
    WidgetsBinding.instance.addPostFrameCallback(_postCallBack);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          controller: _controller,
          child: CustomScrollView(
            controller: _controller,
            slivers: [
              const SliverAppBar(),
              SliverPersistentHeader(
                  floating: true, delegate: BlurryAppBar(title: 'Items')),
              const PokemonItemsLoader(),
              const PokemonItemLoadMore()
            ],
          ),
        ),
      ),
    );
  }
}
