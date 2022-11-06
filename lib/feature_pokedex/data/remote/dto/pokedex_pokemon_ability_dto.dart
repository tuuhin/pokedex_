import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/base_dto/base_pokemon_dto.dart';

part 'pokedex_pokemon_ability_dto.g.dart';

@JsonSerializable()
class PokedexAbilityDto {
  @JsonKey(name: "is_hidden")
  final bool isHiddenAbility;
  @JsonKey(name: "ability")
  final BasePokemonDto pokemon;
  @JsonKey(name: "slot")
  final int slots;

  PokedexAbilityDto({
    required this.isHiddenAbility,
    required this.pokemon,
    required this.slots,
  });

  factory PokedexAbilityDto.fromJson(Map<String, dynamic> json) =>
      _$PokedexAbilityDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokedexAbilityDtoToJson(this);
}
