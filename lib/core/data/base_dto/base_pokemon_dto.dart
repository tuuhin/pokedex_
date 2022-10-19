import 'package:json_annotation/json_annotation.dart';

part '../pokemon_type/base_pokemon_dto.g.dart';

@JsonSerializable()
class BasePokemonDto {
  final String name;
  final String url;
  BasePokemonDto({required this.name, required this.url});
  factory BasePokemonDto.fromJson(Map<String, dynamic> json) =>
      _$BasePokemonDtoFromJson(json);
  Map<String, dynamic> toJson() => _$BasePokemonDtoToJson(this);
}
