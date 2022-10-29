import 'package:flutter_pokedex/core/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_move_detail_model.freezed.dart';

@freezed
class PokemonMoveDetailed with _$PokemonMoveDetailed {
  factory PokemonMoveDetailed({
    required String moveType,
    required List<BasePokemonModel> learnedByPokemon,
    required int id,
    required String name,
    int? power,
    required int pp,
    required int priority,
    int? accuracy,
    required String damageClass,
    required List<PokemonEffectEntriesModel> effect,
    required List<PokemonFlavourTextModel> flavourText,
  }) = _PokemonMoveDetailed;
}
