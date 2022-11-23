import 'package:flutter/material.dart';

import '../../../../domain/models/models.dart';
import '../../widgets.dart';

class PokemonDetailsTab extends StatefulWidget {
  final PokedexPokemonModel model;
  const PokemonDetailsTab({Key? key, required this.model}) : super(key: key);

  @override
  State<PokemonDetailsTab> createState() => _PokemonDetailsTabState();
}

class _PokemonDetailsTabState extends State<PokemonDetailsTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<String> _tabNames = ["About", "Stats", "Evolution", "Moves"];

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.height;
    return SliverFillViewport(
        padEnds: false,
        viewportFraction: (size - 85) / size,
        delegate: SliverChildListDelegate.fixed([
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Column(
              children: [
                TabBar(
                  padding: const EdgeInsets.all(8.0),
                  splashBorderRadius: BorderRadius.circular(40),
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle: const TextStyle(color: Colors.black26),
                  controller: _tabController,
                  tabs: _tabNames
                      .map((value) =>
                          Tab(text: value, iconMargin: EdgeInsets.zero))
                      .toList(),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        PokemonAboutTab(pokeId: widget.model.id),
                        PokemonStatsTab(pokeId: widget.model.id),
                        PokemonEvolutionTab(pokemonId: widget.model.id),
                        PokemonMovesTab(moves: widget.model.moves)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
