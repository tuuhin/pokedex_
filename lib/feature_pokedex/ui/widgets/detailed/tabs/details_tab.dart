import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_pokedex/ui/widgets/widgets.dart';

class PokemonDetailsTab extends StatefulWidget {
  const PokemonDetailsTab({Key? key}) : super(key: key);

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

  final List<Widget> _tabs = const [
    PokemonAboutTab(),
    PokemonStatsTab(),
    PokemonEvolutionTab(),
    PokemonMovesTab()
  ];

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              TabBar(
                splashBorderRadius: BorderRadius.circular(40),
                padding: EdgeInsets.zero,
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
                child: TabBarView(controller: _tabController, children: _tabs),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
