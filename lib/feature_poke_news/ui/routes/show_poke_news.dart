import 'package:flutter/material.dart';
import 'package:flutter_pokedex/main.dart';
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
    double delta = MediaQuery.of(context).size.height * .1;
    if (_scrollController.position.maxScrollExtent -
            _scrollController.position.pixels <=
        delta) {
      ref.read(pokeNewsProviderPaginated.notifier).requestNews();
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
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: const [
            SliverAppBar(
              floating: true,
              title: Text('Pokemon News'),
            ),
            PokeNewsDetailed(),
            PokeDetailedNewsLoadMore()
          ],
        ),
      ),
    );
  }
}
