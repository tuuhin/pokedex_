import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/models.dart';
import 'pokemon_with_ability_model.dart';

part 'pokemon_ability.freezed.dart';

@freezed
class PokemonAbility with _$PokemonAbility {
  factory PokemonAbility({
    required String name,
    required List<PokemonFlavourTextModel> flavourText,
    required List<PokemonEffectEntriesModel> effectEntries,
    required List<PokemonWithAbility> pokemon,
  }) = _PokemonAbility;
}
