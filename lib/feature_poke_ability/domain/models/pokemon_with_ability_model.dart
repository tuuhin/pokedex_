import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/base_pokemon_model.dart';

part 'pokemon_with_ability_model.freezed.dart';

@freezed
class PokemonWithAbility with _$PokemonWithAbility {
  factory PokemonWithAbility({
    required bool hiddenAbility,
    required BasePokemonModel pokemon,
    required int slots,
  }) = _PokemonWithAbility;
}
