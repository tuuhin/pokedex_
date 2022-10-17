import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_move_detail_model.freezed.dart';

@freezed
class PokemonMoveDetailed with _$PokemonMoveDetailed {
  factory PokemonMoveDetailed({
    required String moveType,
    required List<LearnedByPokemon> learnedByPokemon,
    required int id,
    required String name,
    int? power,
    required int pp,
    required int priority,
    int? accuracy,
    required String damageClass,
    required String effect,
    required String flavourText,
  }) = _PokemonMoveDetailed;
}

@freezed
class LearnedByPokemon with _$LearnedByPokemon {
  factory LearnedByPokemon(
      {required String name,
      required String url,
      String? imageURL}) = _LearnedByPokemon;
}
