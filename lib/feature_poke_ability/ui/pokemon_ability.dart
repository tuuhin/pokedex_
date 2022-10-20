import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../context/provider.dart';

class PokemonAbilityPage extends StatelessWidget {
  const PokemonAbilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ability")),
      body: Consumer(
        builder: (context, ref, child) =>
            ref.watch(pokemonAbilityNotifier).maybeWhen(
                  orElse: () => const Text("hellow"),
                  data: (data) => ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, idx) => ListTile(
                      title: Text(data[idx].name),
                    ),
                  ),
                ),
      ),
    );
  }
}
