import 'package:flutter_pokedex/core/data/base_dto/base_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_species_dto.g.dart';

@JsonSerializable()
class PokemonSpeciesDto {
  @JsonKey(name: "base_happiness")
  int baseHappiness;
  @JsonKey(name: "capture_rate")
  int captureRate;
  @JsonKey(name: "egg_group")
  List<BaseResponseResultsDto> eggGroups;
  @JsonKey(name: "evolution_chain")
  EvolutionChainUrl evolutionChain;
  @JsonKey(name: "evolves_from_species")
  BaseResponseResultsDto evolvesFromSpecies;
  @JsonKey(name: "flavor_text_entries")
  List<PokemonFlavourTextDto> flavorTextEntries;
  @JsonKey(name: "forms_switchable")
  bool formsSwitchable;
  @JsonKey(name: "gender_rate")
  int genderRate;
  @JsonKey(name: "growth_rate")
  BaseResponseResultsDto growthRate;
  BaseResponseResultsDto habitat;
  @JsonKey(name: "has_gender_differences")
  bool hasGenderDifferences;
  @JsonKey(name: "hatch_counter")
  int hatchCounter;
  int id;
  @JsonKey(name: "is_baby")
  bool isBaby;
  @JsonKey(name: "is_legendary")
  bool isLegendary;
  @JsonKey(name: "is_mythical")
  bool isMythical;
  String name;

  int order;
  PokemonSpeciesDto({
    required this.baseHappiness,
    required this.captureRate,
    required this.eggGroups,
    required this.evolutionChain,
    required this.evolvesFromSpecies,
    required this.flavorTextEntries,
    required this.formsSwitchable,
    required this.genderRate,
    required this.growthRate,
    required this.habitat,
    required this.hasGenderDifferences,
    required this.hatchCounter,
    required this.id,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.name,
    required this.order,
  });
  factory PokemonSpeciesDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpeciesDtoToJson(this);
}

@JsonSerializable()
class EvolutionChainUrl {
  String url;
  EvolutionChainUrl({
    required this.url,
  });

  factory EvolutionChainUrl.fromJson(Map<String, dynamic> json) =>
      _$EvolutionChainUrlFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionChainUrlToJson(this);
}
