import 'package:flutter_pokedex/core/util/utlis.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/data/base_dto/base_response_results_dto.dart';
import '../../../domain/models/evolution_chain_details_model.dart';

part 'evolution_details_dto.g.dart';

Iterable<EvolutionChainDto> _destructure(EvolutionChainDto evl) sync* {
  for (final EvolutionChainDto element in evl.evolvesTo) {
    yield element._copyWith(
        previous: evl.species.name,
        preUrl:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${getIdFromString(evl.species.url)}.png');
    yield* _destructure(element);
  }
}

@JsonSerializable()
class EvolutionChainDetailsDto {
  EvolutionChainDetailsDto({
    required this.chain,
    required this.id,
  });
  @JsonKey(name: "chain")
  EvolutionChainDto chain;
  @JsonKey(name: "id")
  int id;

  factory EvolutionChainDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$EvolutionChainDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionChainDetailsDtoToJson(this);

  /// I am keeping the previous attempt as a memory
  // List<EvolutionChainDto> _destructure(EvolutionChainDto evChain) {
  //   if (evChain.evolvesTo.isEmpty) {
  //     debugPrint("adding");
  //   } else {
  //     return evChain.evolvesTo.map((e) => _destructure(e)).first;
  //   }
  //   return evChain.evolvesTo;
  // }

  Future<EvolutionChainDetailedModel> toModel() async {
    Iterable<EvolutionChainDto> chains = _destructure(chain);
    return EvolutionChainDetailedModel(
        chain: chains.map((e) => e.toChain()).toList());
  }
}

@JsonSerializable()
class EvolutionChainDto {
  EvolutionChainDto({
    required this.evolutionDetails,
    required this.evolvesTo,
    required this.isBaby,
    required this.species,
    this.fromSpecies,
    this.fromSpeciesUrl,
  });

  @JsonKey(name: "evolution_details")
  List<EvolutionDetailDto> evolutionDetails;
  @JsonKey(name: "evolves_to")
  List<EvolutionChainDto> evolvesTo;
  @JsonKey(name: "is_baby")
  bool isBaby;
  @JsonKey(ignore: true)
  String? fromSpecies;
  @JsonKey(ignore: true)
  String? fromSpeciesUrl;

  BaseResponseResultsDto species;

  factory EvolutionChainDto.fromJson(Map<String, dynamic> json) =>
      _$EvolutionChainDtoFromJson(json);
  Map<String, dynamic> toJson() => _$EvolutionChainDtoToJson(this);

  EvolutionChainDto _copyWith({String? previous, String? preUrl}) =>
      EvolutionChainDto(
        evolutionDetails: evolutionDetails,
        evolvesTo: evolvesTo,
        isBaby: isBaby,
        species: species,
        fromSpecies: previous?.toTitleCase(),
        fromSpeciesUrl: preUrl,
      );

  EvolutionChain toChain() => EvolutionChain(
        details: evolutionDetails.map((e) => e.toDetails()).toList().first,
        isBaby: isBaby,
        toSpecies: species.name.toTitleCase(),
        fromSpecies: fromSpecies ?? '',
        fromSpeciesURL: fromSpeciesUrl,
        toSpeciesURL:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${getIdFromString(species.url)}.png',
      );
}

@JsonSerializable()
class EvolutionDetailDto {
  EvolutionDetailDto({
    this.gender,
    this.heldItem,
    this.item,
    this.location,
    required this.minLevel,
    required this.timeOfDay,
    required this.trigger,
  });
  @JsonKey(name: "gender")
  Gender? gender;
  @JsonKey(name: "held_item")
  BaseResponseResultsDto? heldItem;
  @JsonKey(name: "item")
  BaseResponseResultsDto? item;
  @JsonKey(name: "location")
  BaseResponseResultsDto? location;
  @JsonKey(name: "min_level")
  int? minLevel;
  @JsonKey(name: "time_of_day")
  TimeOfDay timeOfDay;
  @JsonKey(name: "trigger")
  BaseResponseResultsDto trigger;

  factory EvolutionDetailDto.fromJson(Map<String, dynamic> json) =>
      _$EvolutionDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionDetailDtoToJson(this);

  EvolutionDetails toDetails() => EvolutionDetails(
        gender: gender,
        minLevel: minLevel,
        timeOfDay: timeOfDay,
        triggerName: trigger.name.removeDash().toTitleCase(),
        heldItemName: heldItem?.name.toTitleCase(),
        itemName: item?.name.toTitleCase(),
        location: location?.name.toTitleCase(),
      );
}

@JsonEnum(fieldRename: FieldRename.snake)
enum TimeOfDay {
  @JsonValue("")
  empty,
  @JsonValue("day")
  day,
  @JsonValue("night")
  night
}

@JsonEnum()
enum Gender {
  @JsonValue("male")
  male,
  @JsonValue("female")
  female,
  @JsonValue("genderless")
  genderless
}
