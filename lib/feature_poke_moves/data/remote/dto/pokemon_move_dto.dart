import 'package:flutter_pokedex/feature_poke_moves/domain/models/pokemon_move_simplified_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_move_dto.g.dart';

@JsonSerializable()
class PokemonMoveDto {
  final int count;
  @JsonKey(name: "next")
  final String? nextURL;
  @JsonKey(name: "previous")
  final String? previousURL;
  final List<PokemonMoveSimplifiedDto> results;
  PokemonMoveDto({
    required this.count,
    this.nextURL,
    this.previousURL,
    required this.results,
  });
  factory PokemonMoveDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonMoveDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonMoveDtoToJson(this);

  PokemonMove toModel() => PokemonMove(
      results: results.map((e) => e.toModel()).toList(),
      previousURL: previousURL,
      nextURL: nextURL);
}

@JsonSerializable()
class PokemonMoveSimplifiedDto {
  final String name;
  final String url;
  PokemonMoveSimplifiedDto({required this.name, required this.url});
  factory PokemonMoveSimplifiedDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonMoveSimplifiedDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonMoveSimplifiedDtoToJson(this);

  PokemonMoveSimplified toModel() =>
      PokemonMoveSimplified(name: name, url: url);
}
