import 'package:json_annotation/json_annotation.dart';

part 'pokemon_move_dto.g.dart';

@JsonSerializable()
class PokemonMoveDto {
  final int count;
  final String? nextURL;
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
}

@JsonSerializable()
class PokemonMoveSimplifiedDto {
  final String name;
  final String url;
  PokemonMoveSimplifiedDto({required this.name, required this.url});
  factory PokemonMoveSimplifiedDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonMoveSimplifiedDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonMoveSimplifiedDtoToJson(this);
}
