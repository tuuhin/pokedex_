import 'package:json_annotation/json_annotation.dart';

part 'pokemon_language_dto.g.dart';

@JsonSerializable()
class PokemonLanguageDto {
  @JsonKey(name: "name")
  final String name;

  PokemonLanguageDto({required this.name});

  factory PokemonLanguageDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonLanguageDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonLanguageDtoToJson(this);
}
