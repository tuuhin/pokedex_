import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/models.dart';
import '../domain/repository/pokemon_species_repo.dart';
import 'providers.dart';

class PokemonSpeciesNotifier
    extends StateNotifier<AsyncValue<PokemonSpeciesModel>> {
  PokemonSpeciesNotifier(this._repository, {required this.ref})
      : super(const AsyncValue.loading());

  final PokemonSpeciesRepository _repository;
  final Ref ref;

  void getSpeciesData(int pokeId) async {
    try {
      PokemonSpeciesModel data = await _repository.getSpeciesDetials(pokeId);
      ref.read(evolutionIdProvider.notifier).setId(data.evolutionChainId);
      state = AsyncValue.data(data);
    } catch (e, stk) {
      debugPrintStack(stackTrace: stk);
      state = AsyncValue.error(e, stk);
    }
  }
}
