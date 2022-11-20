import 'package:flutter_pokedex/core/util/utlis.dart';
import 'package:flutter_pokedex/feature_pokedex/domain/models/base_stats_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/data/base_dto/base_dto.dart';

part 'pokedex_pokemon_stats_dto.g.dart';

@JsonSerializable()
class PokedexPokemonStatsDto {
  @JsonKey(name: "stat")
  final BaseResponseResultsDto stat;
  @JsonKey(name: "effort")
  final double effort;
  @JsonKey(name: "base_stat")
  final double baseStat;

  PokedexPokemonStatsDto(
      {required this.stat, required this.effort, required this.baseStat});
  factory PokedexPokemonStatsDto.fromJson(Map<String, dynamic> json) =>
      _$PokedexPokemonStatsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokedexPokemonStatsDtoToJson(this);

  BaseStatsModel toModel() => BaseStatsModel(
      name: stat.name.simpleName(), baseStat: baseStat, effort: effort);
}
