import 'package:flutter_pokedex/core/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base_dto.dart';

part 'pokemon_flavour_text_dto.g.dart';

@JsonSerializable()
class PokemonFlavourTextDto {
  @JsonKey(name: "flavor_text")
  final String text;

  @JsonKey(name: "language")
  final PokemonLanguageDto language;

  PokemonFlavourTextDto({required this.text, required this.language});

  factory PokemonFlavourTextDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonFlavourTextDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonFlavourTextDtoToJson(this);

  PokemonFlavourTextModel toModel() => PokemonFlavourTextModel(text: text);
}
