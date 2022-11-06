import 'package:json_annotation/json_annotation.dart';

import '../../../../core/data/base_dto/base_dto.dart';

part 'pokedex_pokemon_move_dto.g.dart';

@JsonSerializable()
class PokedexPokemonMove {
  @JsonKey(name: "move")
  final BaseResponseResultsDto move;
  @JsonKey(name: "version_group_details")
  final List<PokedexPokemonMoveVersions> details;

  PokedexPokemonMove({
    required this.move,
    required this.details,
  });

  factory PokedexPokemonMove.fromJson(Map<String, dynamic> json) =>
      _$PokedexPokemonMoveFromJson(json);

  Map<String, dynamic> toJson() => _$PokedexPokemonMoveToJson(this);
}

@JsonSerializable()
class PokedexPokemonMoveVersions {
  @JsonKey(name: "move_learn_method")
  final BaseResponseResultsDto moveLearnedMethod;
  @JsonKey(name: "version_group")
  final BaseResponseResultsDto version;

  @JsonKey(name: "level_learned_at")
  final int levelLearnedAt;

  PokedexPokemonMoveVersions({
    required this.moveLearnedMethod,
    required this.version,
    required this.levelLearnedAt,
  });

  factory PokedexPokemonMoveVersions.fromJson(Map<String, dynamic> json) =>
      _$PokedexPokemonMoveVersionsFromJson(json);

  Map<String, dynamic> toJson() => _$PokedexPokemonMoveVersionsToJson(this);
}
