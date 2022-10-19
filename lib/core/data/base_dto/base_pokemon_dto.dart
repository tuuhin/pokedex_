import 'package:flutter_pokedex/core/models/base_pokemon_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../util/string_helper.dart';

part 'base_pokemon_dto.g.dart';

@JsonSerializable()
class BasePokemonDto {
  final String name;
  final String url;
  BasePokemonDto({required this.name, required this.url});
  factory BasePokemonDto.fromJson(Map<String, dynamic> json) =>
      _$BasePokemonDtoFromJson(json);
  Map<String, dynamic> toJson() => _$BasePokemonDtoToJson(this);

  BasePokemonModel toModel() => BasePokemonModel(
        name: name,
        url: url,
        imageUrl:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${getIdFromString(url) ?? 1}.png',
      );
}
