import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_poke_news/ui/pokedex_news.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Colors.grey),
              )),
          const Flexible(flex: 2, child: PokeDexNews()),
        ],
      ),
    );
  }
}
