import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/widget/transitions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../context/providers.dart';
import '../widgets.dart';

class PokeNewsDetailed extends ConsumerStatefulWidget {
  const PokeNewsDetailed({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokeNewsDetailedState();
}

class _PokeNewsDetailedState extends ConsumerState<PokeNewsDetailed> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final int count = ref.read(pokeNewsProviderPaginated.notifier).countItem;
    final GlobalKey<SliverAnimatedListState> key =
        ref.read(pokeNewsProviderPaginated.notifier).newsStateKey;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      for (int i = 0; i < count; i++) {
        key.currentState?.insertItem(i);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: ref.watch(pokeNewsProviderPaginated).when(
            loading: () => const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
            loadMore: (data) => SliverAnimatedList(
              key: ref.read(pokeNewsProviderPaginated.notifier).newsStateKey,
              itemBuilder: (context, index, animation) => LoadTransition(
                animation: animation,
                child: PokeNewsDetailedCard(news: data[index]),
              ),
            ),
            data: (data) => SliverAnimatedList(
              key: ref.read(pokeNewsProviderPaginated.notifier).newsStateKey,
              itemBuilder: (context, index, animation) => LoadTransition(
                animation: animation,
                child: PokeNewsDetailedCard(news: data[index]),
              ),
            ),
            error: (err, stk) => const SliverFillRemaining(
              child: Icon(Icons.face),
            ),
            errorLoadMore: (data, err, stk) => SliverAnimatedList(
              key: ref.read(pokeNewsProviderPaginated.notifier).newsStateKey,
              itemBuilder: (context, index, animation) => LoadTransition(
                animation: animation,
                child: PokeNewsDetailedCard(news: data[index]),
              ),
            ),
            end: (message, data) => SliverAnimatedList(
              key: ref.read(pokeNewsProviderPaginated.notifier).newsStateKey,
              itemBuilder: (context, index, animation) => LoadTransition(
                  animation: animation,
                  child: PokeNewsDetailedCard(news: data[index])),
            ),
          ),
    );
  }
}
