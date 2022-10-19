import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_effect_entries_model.freezed.dart';

@freezed
class PokemonEffectEntriesModel with _$PokemonEffectEntriesModel {
  factory PokemonEffectEntriesModel({
    required String effect,
    required String shortEffect,
  }) = _PokemonEffectEntriesModel;
}
