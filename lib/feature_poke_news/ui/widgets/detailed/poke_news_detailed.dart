import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../context/providers.dart';
import '../widgets.dart';

class PokeNewsDetailed extends ConsumerWidget {
  const PokeNewsDetailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(pokeNewsProviderPaginated).when(
          loading: () => const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          ),
          loadMore: (data) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => LayoutBuilder(builder: (context, _) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: PokeNewsDetailedCard(news: data[index]),
                );
              }),
              childCount: data.length,
            ),
          ),
          data: (data) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: PokeNewsDetailedCard(news: data[index]),
              ),
              childCount: data.length,
            ),
          ),
          error: (err, stk) => const SliverFillRemaining(
            child: Icon(Icons.face),
          ),
          errorLoadMore: (data, err, stk) => SliverList(
              delegate: SliverChildBuilderDelegate(
                  ((context, index) => PokeNewsDetailedCard(news: data[index])),
                  childCount: data.length)),
        );
  }
}
