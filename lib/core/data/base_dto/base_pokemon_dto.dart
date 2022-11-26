import 'package:json_annotation/json_annotation.dart';

import '../../models/base_pokemon_model.dart';
import '../../util/string_helper.dart';
import 'base_dto.dart';

part 'base_pokemon_dto.g.dart';

@JsonSerializable()
class BasePokemonDto extends BaseResponseResultsDto {
  BasePokemonDto({required super.name, required super.url});
  factory BasePokemonDto.fromJson(Map<String, dynamic> json) =>
      _$BasePokemonDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BasePokemonDtoToJson(this);

  BasePokemonModel toPokemonModel() => BasePokemonModel(
        name: name.removeDash().toTitleCase(),
        url: url,
        imageUrl:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${getIdFromString(url)}.png',
      );
}
