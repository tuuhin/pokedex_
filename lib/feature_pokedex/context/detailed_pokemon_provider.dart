import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_pokedex/domain/models/models.dart';

// class DetailedPokemonNotifier extends StateNotifier<PokedexPokemonModel> {
//   final PokedexPokemonModel pokemon;
//   DetailedPokemonNotifier(this.pokemon) : super(pokemon);

//   PokedexPokemonModel get currentPokemon => state;
// }

class DetailedPokemonNotifier extends ChangeNotifier {
  late PokedexPokemonModel pokemon;

  void setPokemon(PokedexPokemonModel newPokemon) {
    pokemon = newPokemon;
    notifyListeners();
  }

  PokedexPokemonModel getPokemon() => pokemon;
}
