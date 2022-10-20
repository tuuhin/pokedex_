import 'package:flutter_pokedex/core/data/base_dto/base_response_results_dto.dart';
import 'package:flutter_pokedex/core/models/base_pokemon_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../util/string_helper.dart';

part 'base_pokemon_dto.g.dart';

@JsonSerializable()
class BasePokemonDto extends BaseResponseResultsDto {
  BasePokemonDto({required String name, required String url})
      : super(name: name, url: url);
  factory BasePokemonDto.fromJson(Map<String, dynamic> json) =>
      _$BasePokemonDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BasePokemonDtoToJson(this);

  BasePokemonModel toPokemonModel() => BasePokemonModel(
        name: name,
        url: url,
        imageUrl:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${getIdFromString(url) ?? 1}.png',
      );
}
