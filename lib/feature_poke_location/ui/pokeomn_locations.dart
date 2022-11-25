import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_poke_location/context/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widget/blurry_appbar.dart';
import 'widgets/widgets.dart';

class PokemonLocations extends ConsumerStatefulWidget {
  const PokemonLocations({super.key});

  @override
  ConsumerState<PokemonLocations> createState() => _PokemonLocationsState();
}

class _PokemonLocationsState extends ConsumerState<PokemonLocations> {
  late ScrollController _controller;

  void _scrollCallBack() {
    double delta = MediaQuery.of(context).size.height * .2;
    if (_controller.position.maxScrollExtent - _controller.position.pixels <=
        delta) {
      ref.read(locationsProvider.notifier).fetchMore();
    }
  }

  void _postFrameCallBack(Duration timestamp) async {
    GlobalKey<SliverAnimatedListState> _key =
        ref.read(locationsProvider.notifier).key;

    for (var i = 0; i < ref.read(locationsProvider.notifier).count; i++) {
      await Future.delayed(const Duration(milliseconds: 400),
          () => _key.currentState?.insertItem(i));
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollCallBack);
    WidgetsBinding.instance.addPostFrameCallback(_postFrameCallBack);
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
                  floating: true, delegate: BlurryAppBar(title: 'Location')),
              const LocationLoader(),
              const LocationLoadMore()
            ],
          ),
        ),
      ),
    );
  }
}
