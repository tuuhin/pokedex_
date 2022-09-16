import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../context/providers.dart';
import '../widgets/pokedex_news_widget.dart';

class ShowPokeNews extends ConsumerStatefulWidget {
  const ShowPokeNews({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShowPokeNewsState();
}

class _ShowPokeNewsState extends ConsumerState<ShowPokeNews> {
  late ScrollController _scrollController;

  void scrollListener() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    double delta = MediaQuery.of(context).size.height * .4;
    if (maxScroll - currentScroll <= delta) {
      ref.read(pokeNewsProviderPaginated.notifier).fetchMorePokeNews();
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const SliverAppBar(
            primary: true,
          ),
          ref.watch(pokeNewsProviderPaginated).when(
                loading: () => const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                ),
                loadMore: (data) => SliverList(
                    delegate: SliverChildBuilderDelegate(
                        ((context, index) =>
                            PokeNewsDetailedCard(news: data[index])),
                        childCount: data.length)),
                data: (data) => SliverList(
                    delegate: SliverChildBuilderDelegate(
                        ((context, index) =>
                            PokeNewsDetailedCard(news: data[index])),
                        childCount: data.length)),
                error: (err, stk) => const SliverFillRemaining(
                  child: Icon(Icons.face),
                ),
                errorLoadMore: (data, err, stk) => SliverList(
                    delegate: SliverChildBuilderDelegate(
                        ((context, index) =>
                            PokeNewsDetailedCard(news: data[index])),
                        childCount: data.length)),
              ),
          ref.watch(pokeNewsProviderPaginated).maybeWhen(
              orElse: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
              loadMore: ((data) => const SliverToBoxAdapter(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ))),
              errorLoadMore: (date, err, stk) => SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('$err'),
                    ),
                  ))
        ],
      ),
    );
  }
}
