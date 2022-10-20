import 'package:flutter/material.dart';
import 'package:flutter_pokedex/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/base_response_model.dart';
import '../../core/util/paginator/paginator.dart';
import '../../core/util/string_helper.dart';
import '../domain/models/pokemon_ability.dart';
import '../domain/repository/pokemon_ability_repository.dart';

class PokemonAbilityNotifier
    extends StateNotifier<Paginator<List<PokemonAbility>>> {
  PokemonAbilityNotifier(this._pokemonAbilityRespository)
      : super(Paginator.loading());

  final PokemonAbilityRespository _pokemonAbilityRespository;

  final List<PokemonAbility> _ability = [];

  int _offset = 0;

  int get abilityCount => _ability.length;

  void init() => _ability.isEmpty ? _fetchSomeAbility() : _fetchMoreAbility();

  void _fetchSomeAbility() async {
    try {
      PokemonBaseResponse base =
          await _pokemonAbilityRespository.getAbility(offset: _offset);
      if (base.next != null) {
        _offset = getIdFromString(base.next!) ?? 1;
      }
      List<PokemonAbility> abilities =
          await _pokemonAbilityRespository.getDetailedAbility(base.results);

      state = Paginator.data(_ability..addAll(abilities));

      logger.fine("done");
    } catch (e, stk) {
      debugPrintStack(stackTrace: stk);
    }
  }

  void _fetchMoreAbility() {}
}
