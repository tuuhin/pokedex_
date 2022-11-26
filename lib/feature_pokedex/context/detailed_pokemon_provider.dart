import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/models.dart';
import '../domain/repository/pokedex_pokemon_repo.dart';

// class DetailedPokemonNotifier extends StateNotifier<PokedexPokemonModel> {
//   final PokedexPokemonModel pokemon;
//   DetailedPokemonNotifier(this.pokemon) : super(pokemon);

//   PokedexPokemonModel get currentPokemon => state;
// }

class DetailedPokedexPokemonNotifier
    extends StateNotifier<AsyncValue<PokedexPokemonModel>> {
  final PokedexPokemonRepository _repository;
  DetailedPokedexPokemonNotifier(this._repository)
      : super(const AsyncValue.loading());

  void _getPokemonDetailsNetwork(int id) async {
    try {
      state = AsyncValue.data(await _repository.getPokemonDetailed(id));
    } catch (e, stk) {
      debugPrintStack(stackTrace: stk);
      state = AsyncValue.error(e, stk);
    }
  }

  void getPokemonDetailsData(int pokeId, List<PokedexPokemonModel> pokemons) {
    List<PokedexPokemonModel> preFetchedPokemons =
        pokemons.where((element) => element.id == pokeId).toList();
    if (preFetchedPokemons.isNotEmpty) {
      state = AsyncValue.data(preFetchedPokemons.first);
    } else {
      _getPokemonDetailsNetwork(pokeId);
    }
  }
}
