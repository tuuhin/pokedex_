import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_species_details_model.freezed.dart';

@freezed
class PokemonSpeciesDetailsModel with _$PokemonSpeciesDetailsModel {
  factory PokemonSpeciesDetailsModel({
    required int baseHappiness,
  }) = _PokemonSpeciesDetailsModel;
}
