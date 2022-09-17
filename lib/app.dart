import 'package:flutter/material.dart';

import './feature_poke_news/ui/pokedex_news.dart';
import './feature_pokedex/ui/ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: const [
            Flexible(flex: 4, child: MainPokDex()),
            Flexible(flex: 2, child: PokeDexNews()),
          ],
        ),
      );
}
