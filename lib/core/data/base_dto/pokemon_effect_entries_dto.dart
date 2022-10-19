import 'package:json_annotation/json_annotation.dart';

import 'base_dto.dart';

part 'pokemon_effect_entries_dto.g.dart';

@JsonSerializable()
class PokemonEffectDto {
  @JsonKey(name: "effect")
  final String effect;

  @JsonKey(name: "short_effect")
  final String shortEffect;

  @JsonKey(name: "language")
  final PokemonLanguageDto language;

  PokemonEffectDto(
      {required this.effect,
      required this.language,
      required this.shortEffect});

  factory PokemonEffectDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonEffectDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonEffectDtoToJson(this);
}
