import 'package:flutter/material.dart';

import './feature_poke_news/ui/pokedex_news.dart';
import './feature_pokedex/ui/ui.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Widget> _childrens = const <Widget>[
    Flexible(flex: 4, child: MainPokDex()),
    Flexible(flex: 2, child: PokeDexNews()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
          builder: (context, constraints) => constraints.maxWidth < 600
              ? Column(children: _childrens)
              : Row(children: _childrens)),
    );
  }
}
