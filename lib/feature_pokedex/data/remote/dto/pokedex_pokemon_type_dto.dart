import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/base_dto/base_pokemon_dto.dart';

part 'pokedex_pokemon_type_dto.g.dart';

@JsonSerializable()
class PokedexPokemonTypeDto {
  @JsonKey(name: "type")
  final BasePokemonDto pokemon;
  @JsonKey(name: "slot")
  final int slots;

  PokedexPokemonTypeDto({
    required this.pokemon,
    required this.slots,
  });

  factory PokedexPokemonTypeDto.fromJson(Map<String, dynamic> json) =>
      _$PokedexPokemonTypeDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokedexPokemonTypeDtoToJson(this);
}
