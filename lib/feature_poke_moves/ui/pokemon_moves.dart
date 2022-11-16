import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widget/blurry_appbar.dart';
import '../context/provider.dart';
import './ui.dart';

class PokeMonMoves extends ConsumerStatefulWidget {
  const PokeMonMoves({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokeMonMovesState();
}

class _PokeMonMovesState extends ConsumerState<PokeMonMoves> {
  late ScrollController _scrollController;

  void _loadMore() {
    double delta = MediaQuery.of(context).size.height * .2;
    if (_scrollController.position.maxScrollExtent -
            _scrollController.position.pixels <=
        delta) {
      ref.read(pokeMovesProvider.notifier).requestMore();
    }
  }

  void _postFrameCallBack(Duration timestamp) async {
    int count = ref.read(pokeMovesProvider.notifier).moveCount;
    GlobalKey<SliverAnimatedListState> listKey =
        ref.read(pokeMovesProvider.notifier).key;
    for (int i = 0; i < count; i++) {
      await Future.delayed(
        const Duration(milliseconds: 100),
        () => listKey.currentState?.insertItem(i),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_loadMore);
    WidgetsBinding.instance.addPostFrameCallback(_postFrameCallBack);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        controller: _scrollController,
        child: SafeArea(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              const SliverAppBar(),
              SliverPersistentHeader(
                  floating: true, delegate: BlurryAppBar(title: "Moves")),
              const PokeMovesLoader(),
              const PokemonMovesLoadMore()
            ],
          ),
        ),
      ),
    );
  }
}
