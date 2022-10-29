import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_poke_moves/context/provider.dart';
import 'package:flutter_pokedex/feature_poke_moves/ui/pokemon_moves_load_more.dart';
import 'package:flutter_pokedex/feature_poke_moves/ui/pokemon_moves_loader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokeMonMoves extends ConsumerStatefulWidget {
  const PokeMonMoves({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokeMonMovesState();
}

class _PokeMonMovesState extends ConsumerState<PokeMonMoves> {
  late ScrollController _scrollController;

  void loadMore() {
    double delta = MediaQuery.of(context).size.height * .2;
    if (_scrollController.position.maxScrollExtent -
            _scrollController.position.pixels <=
        delta) {
      ref.read(pokeMovesProvider.notifier).requestMore();
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(loadMore);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        controller: _scrollController,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: const [
            SliverAppBar(
              floating: true,
              title: Text('Pokemon Moves'),
            ),
            PokeMovesLoader(),
            PokemonMovesLoadMore()
          ],
        ),
      ),
    );
  }
}
