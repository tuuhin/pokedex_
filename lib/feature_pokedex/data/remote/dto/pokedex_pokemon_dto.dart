import 'package:json_annotation/json_annotation.dart';

import '../../../../feature_poke_ability/data/remote/dto/pokemon_ability_dto.dart';
import '../../../../feature_type_charts/data/remote/dto/pokemon_with_type.dart';
import '../remote.dart';

part 'pokedex_pokemon_dto.g.dart';

/// [Info] this is the main serializer of the app thus relation
///  with other features are allowed
@JsonSerializable()
class PokedexPokemonDto {
  @JsonKey(name: "abilities")
  final List<PokemonWithAbilityDto> abilities;
  @JsonKey(name: "base_experience")
  final int baseXp;
  @JsonKey(name: "height")
  final int height;
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "is_default")
  final bool isDefault;
  @JsonKey(name: "moves")
  final PokedexPokemonMove moves;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "order")
  final int order;
  @JsonKey(name: "stats")
  final PokedexPokemonStatsDto stats;
  @JsonKey(name: "types")
  final PokemonWithTypeDto types;
  @JsonKey(name: "weight")
  final int weight;

  PokedexPokemonDto({
    required this.abilities,
    required this.moves,
    required this.name,
    required this.order,
    required this.stats,
    required this.types,
    required this.baseXp,
    required this.height,
    required this.id,
    required this.weight,
    required this.isDefault,
  });

  factory PokedexPokemonDto.fromJson(Map<String, dynamic> json) =>
      _$PokedexPokemonDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokedexPokemonDtoToJson(this);
}
