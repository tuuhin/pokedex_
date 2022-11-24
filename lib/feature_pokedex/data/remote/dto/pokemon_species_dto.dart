import 'package:flutter_pokedex/core/data/base_dto/base_dto.dart';
import 'package:flutter_pokedex/core/util/utlis.dart';
import 'package:flutter_pokedex/feature_pokedex/domain/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_species_dto.g.dart';

@JsonSerializable()
class PokemonSpeciesDto {
  @JsonKey(name: "base_happiness")
  int? baseHappiness;
  @JsonKey(name: "capture_rate")
  int captureRate;
  @JsonKey(name: "egg_groups")
  List<BaseResponseResultsDto> eggGroups;
  @JsonKey(name: "evolution_chain")
  EvolutionChainUrl? evolutionChain;
  @JsonKey(name: "evolves_from_species")
  BaseResponseResultsDto? evolvesFromSpecies;
  @JsonKey(name: "flavor_text_entries")
  List<PokemonFlavourTextDto> flavorTextEntries;
  @JsonKey(name: "forms_switchable")
  bool formsSwitchable;
  @JsonKey(name: "gender_rate")
  double genderRate;
  @JsonKey(name: "growth_rate")
  BaseResponseResultsDto growthRate;
  @JsonKey(name: "has_gender_differences")
  bool hasGenderDifferences;

  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "is_baby")
  bool isBaby;
  @JsonKey(name: "is_legendary")
  bool isLegendary;
  @JsonKey(name: "is_mythical")
  bool isMythical;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "order")
  int order;

  PokemonSpeciesDto({
    required this.captureRate,
    required this.eggGroups,
    this.evolutionChain,
    this.evolvesFromSpecies,
    required this.flavorTextEntries,
    required this.formsSwitchable,
    required this.genderRate,
    required this.growthRate,
    required this.hasGenderDifferences,
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

  PokemonSpeciesModel toModel() => PokemonSpeciesModel(
      captureRate: captureRate,
      eggGroups: eggGroups.map((e) => e.name.toTitleCase()),
      evolutionChainId:
          evolutionChain != null ? getIdFromString(evolutionChain!.url) : null,
      flavorTextEntries: flavorTextEntries
          .where((element) => element.language.name == 'en')
          .map((e) => e.toModel())
          .toSet()
          .toList(),
      maleCount: (1 - genderRate / 8) * 100,
      femaleCount: (genderRate / 8) * 100,
      growthRate: growthRate.name,
      id: id,
      isBaby: isBaby,
      isLegendary: isLegendary,
      isMythical: isMythical,
      name: name,
      order: order);
}

@JsonSerializable()
class EvolutionChainUrl {
  String url;
  EvolutionChainUrl({required this.url});

  factory EvolutionChainUrl.fromJson(Map<String, dynamic> json) =>
      _$EvolutionChainUrlFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionChainUrlToJson(this);
}
