import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../context/providers.dart';
import '../widgets/widgets.dart';

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
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: const [
          SliverAppBar(primary: true, title: Text('Pokemon News')),
          PokeNewsDetailed(),
          PokeDetailedNewsLoadMore()
        ],
      ),
    );
  }
}
