import 'package:flutter_pokedex/core/models/models.dart';
import 'package:flutter_pokedex/core/util/string_helper.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base_dto.dart';

part 'pokemon_flavour_text_dto.g.dart';

@JsonSerializable()
class PokemonFlavourTextDto {
  ///[text1] and [text2] there are types
  ///due to which somewhere the api gives the jsonkey as `text1`
  ///otherwise `text2`.So for the matter of concern the not null one will be taken
  @JsonKey(name: "flavor_text")
  final String? text1;

  @JsonKey(name: 'text')
  final String? text2;

  @JsonKey(name: "language")
  final PokemonLanguageDto language;

  PokemonFlavourTextDto({this.text1, this.text2, required this.language});

  factory PokemonFlavourTextDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonFlavourTextDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonFlavourTextDtoToJson(this);

  PokemonFlavourTextModel toModel() => PokemonFlavourTextModel(
      text: removeSpecialChars(text1 != null ? text1! : text2 ?? ''));
}
