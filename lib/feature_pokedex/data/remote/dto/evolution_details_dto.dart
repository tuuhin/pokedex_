import 'package:json_annotation/json_annotation.dart';

import '../../../../core/data/base_dto/base_response_results_dto.dart';
part 'evolution_details_dto.g.dart';

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
}

@JsonSerializable()
class EvolutionChainDto {
  EvolutionChainDto({
    required this.evolutionDetails,
    required this.evolvesTo,
    required this.isBaby,
    required this.species,
  });
  @JsonKey(name: "evolution_detials")
  List<EvolutionDetailDto> evolutionDetails;
  @JsonKey(name: "evolves_to")
  List<EvolutionChainDto> evolvesTo;
  @JsonKey(name: "is_baby")
  bool isBaby;

  BaseResponseResultsDto species;

  factory EvolutionChainDto.fromJson(Map<String, dynamic> json) =>
      _$EvolutionChainDtoFromJson(json);
  Map<String, dynamic> toJson() => _$EvolutionChainDtoToJson(this);
}

@JsonSerializable()
class EvolutionDetailDto {
  EvolutionDetailDto({
    this.gender,
    this.heldItem,
    required this.item,
    required this.location,
    required this.minLevel,
    required this.timeOfDay,
    required this.trigger,
  });

  Gender? gender;
  @JsonKey(name: "held_item")
  BaseResponseResultsDto? heldItem;
  BaseResponseResultsDto item;
  BaseResponseResultsDto location;
  @JsonKey(name: "min_level")
  int minLevel;
  @JsonKey(name: "time_of_day")
  TimeOfDay timeOfDay;
  BaseResponseResultsDto trigger;

  factory EvolutionDetailDto.fromJson(Map<String, dynamic> json) =>
      _$EvolutionDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionDetailDtoToJson(this);
}

@JsonEnum(fieldRename: FieldRename.snake)
enum TimeOfDay { empty, day, night }

@JsonEnum()
enum Gender { male, female, genderless }
