import 'package:flutter_pokedex/core/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_species_model.freezed.dart';

@freezed
class PokemonSpeciesModel with _$PokemonSpeciesModel {
  factory PokemonSpeciesModel({
    required int baseHappiness,
    required int captureRate,
    required Iterable<String> eggGroups,
    required int evolutionChainId,
    required List<PokemonFlavourTextModel> flavorTextEntries,
    required double maleCount,
    required double femaleCount,
    required String growthRate,
    required String habitat,
    required int id,
    bool? isBaby,
    bool? isLegendary,
    bool? isMythical,
    required String name,
    required int order,
  }) = _PokemonSpeciesModel;
}
