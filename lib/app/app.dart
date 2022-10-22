import 'package:flutter/material.dart';

import '../feature_poke_news/ui/pokedex_news.dart';
import 'pokedex_main.dart';

class App extends StatelessWidget {
  const App({super.key});

  final List<Widget> _childrens = const <Widget>[
    Flexible(flex: 4, child: MainPokDex()),
    Flexible(flex: 2, child: PokeDexNews()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
          builder: (context, constraints) => constraints.maxWidth < 800
              ? Column(children: _childrens)
              : Row(children: _childrens)),
    );
  }
}
