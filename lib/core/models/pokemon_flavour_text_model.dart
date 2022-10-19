import 'package:freezed_annotation/freezed_annotation.dart';
part 'pokemon_flavour_text_model.freezed.dart';

@freezed
class PokemonFlavourTextModel with _$PokemonFlavourTextModel {
  factory PokemonFlavourTextModel({required String text}) =
      _PokemonFlavourEntries;
}
