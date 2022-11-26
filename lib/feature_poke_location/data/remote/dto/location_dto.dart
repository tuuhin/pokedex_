import 'package:flutter_pokedex/core/util/utlis.dart';
import 'package:flutter_pokedex/feature_poke_location/data/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/data/base_dto/base_dto.dart';
import '../../../domain/domain.dart';

part 'location_dto.g.dart';

@JsonSerializable()
class PokemonLocationDto {
  
  @JsonKey(name: "locations")
  final List<BaseResponseResultsDto> locations;
  @JsonKey(name: "main_generation")
  final BaseResponseResultsDto? generation;
  @JsonKey(name: "name")
  final String name;

  PokemonLocationDto({
    required this.locations,
    required this.name,
    this.generation,
  });

  LocationModel toModel() => LocationModel(
        regionName: name.removeDash().toTitleCase(),
        locations: getUniqueSet(locations.map((e) => e.name)),
        gen: generation?.name.toTitleCase(),
      );

  factory PokemonLocationDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonLocationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonLocationDtoToJson(this);
}
