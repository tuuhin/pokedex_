import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/widget/core_widgets.dart';
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
  Widget build(BuildContext context) => SliverPadding(
        padding: const EdgeInsets.all(8.0),
        sliver: ref.watch(pokeNewsProviderPaginated).when(
              loading: () => const SliverFillRemaining(
                child:
                    LoadingInfo(text: "Getting news", color: Color(0xffF7E7CE)),
              ),
              loadMore: (data) => PokemonNewsDetailedList(data),
              data: (data) => PokemonNewsDetailedList(data),
              error: (err, stk) => SliverFillRemaining(
                  child: PaginatorErrorWidget(
                      refresh: ref
                          .read(pokeNewsProviderPaginated.notifier)
                          .refresh)),
              errorLoadMore: (data, err, stk) => PokemonNewsDetailedList(data),
              end: (message, data) => PokemonNewsDetailedList(data),
            ),
      );
}
