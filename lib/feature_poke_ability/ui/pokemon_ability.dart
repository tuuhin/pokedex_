import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widget/blurry_appbar.dart';
import '../context/provider.dart';
import '../ui/ui.dart';

class PokemonAbilityPage extends ConsumerStatefulWidget {
  const PokemonAbilityPage({super.key});

  @override
  ConsumerState<PokemonAbilityPage> createState() => _PokemonAbilityPageState();
}

class _PokemonAbilityPageState extends ConsumerState<PokemonAbilityPage> {
  late final ScrollController _scrollController;

  void _scrollCallBack() {
    double delta = MediaQuery.of(context).size.height * .2;
    if (_scrollController.position.maxScrollExtent -
            _scrollController.position.pixels <=
        delta) {
      ref.read(pokemonAbilityProvider.notifier).fetchMore();
    }
  }

  void _postFrameCallBack(Duration timestamp) async {
    int count = ref.read(pokemonAbilityProvider.notifier).abilityCount;
    GlobalKey<SliverAnimatedListState> listKey =
        ref.read(pokemonAbilityProvider.notifier).key;
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
    _scrollController.addListener(_scrollCallBack);
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
                floating: true,
                delegate: BlurryAppBar(title: "Abilities"),
              ),
              const PokemonAbilityLoader(),
              const PokemonAbilityLoadMore()
            ],
          ),
        ),
      ),
    );
  }
}
