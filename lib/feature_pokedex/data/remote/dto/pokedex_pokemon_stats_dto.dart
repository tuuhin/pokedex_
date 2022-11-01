import 'package:json_annotation/json_annotation.dart';

import '../../../../core/data/base_dto/base_dto.dart';

part 'pokedex_pokemon_stats_dto.g.dart';

@JsonSerializable()
class PokedexPokemonStatsDto {
  @JsonKey(name: "stat")
  final BaseResponseResultsDto stat;
  @JsonKey(name: "effort")
  final int effort;
  @JsonKey(name: "base_stat")
  final int baseStat;

  PokedexPokemonStatsDto(
      {required this.stat, required this.effort, required this.baseStat});
  factory PokedexPokemonStatsDto.fromJson(Map<String, dynamic> json) =>
      _$PokedexPokemonStatsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokedexPokemonStatsDtoToJson(this);
}
