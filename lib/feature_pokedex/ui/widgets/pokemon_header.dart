import 'package:flutter/material.dart';
import 'package:flutter_pokedex/core/context/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './widgets.dart';

class PokeMonHeader extends StatelessWidget {
  const PokeMonHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Positioned(
            right: -size.width * .13,
            top: -size.width * .13,
            child: SizedBox(
                height: size.width * .5, child: const RotatingPokeBall())),
        Positioned(
          right: size.width * .05,
          top: size.width * .05,
          child: Consumer(
            builder: (context, ref, child) => FloatingActionButton(
                onPressed: ref.read(themeProvider.notifier).toggleTheme,
                child: ref.watch(themeProvider) == ThemeMode.dark
                    ? const Icon(Icons.light_mode)
                    : const Icon(Icons.dark_mode)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What Pokemon are you looking for ?',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyText1?.color),
              ),
              const SizedBox(height: 20),
              const TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search Pokemon,Move or ability',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
