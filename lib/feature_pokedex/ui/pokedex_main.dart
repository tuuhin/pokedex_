import 'package:flutter/material.dart';

import './widgets/widgets.dart';

class MainPokDex extends StatelessWidget {
  const MainPokDex({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Stack(
        alignment: FractionalOffset.center,
        children: [
          const RotatingPokeBall(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'What Pokemon are you looking for ?',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.subtitle1?.color),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextField(
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 0),
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 0),
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Search Pokemon,Move or ability',
                      fillColor: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Expanded(child: PokeMonAboutCardList())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
