import 'package:json_annotation/json_annotation.dart';

import '../../../../core/data/base_dto/base_pokemon_dto.dart';

part 'pokemon_with_type.g.dart';

@JsonSerializable()
class PokemonWithTypeDto {
  @JsonKey(name: 'pokemon')
  final BasePokemonDto pokemon;

  @JsonKey(name: "slot")
  final int slot;

  PokemonWithTypeDto({required this.pokemon, required this.slot});

  factory PokemonWithTypeDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonWithTypeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonWithTypeDtoToJson(this);
}
