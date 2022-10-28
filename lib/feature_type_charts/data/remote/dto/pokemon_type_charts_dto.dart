import 'package:json_annotation/json_annotation.dart';

import '../../../../core/data/base_dto/base_pokemon_dto.dart';
import '../../../../core/data/base_dto/base_response_results_dto.dart';
import '../../../domain/models/pokemon_types_detailed_model.dart';
import './damage_relation_dto.dart';
import './pokemon_with_type.dart';

part 'pokemon_type_charts_dto.g.dart';

@JsonSerializable()
class PokemonTypeChartsDto {
  @JsonKey(name: 'damage_relations')
  final DamageRelationDto damageRelationDto;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'move_damage_class')
  final BaseResponseResultsDto? moveDamageClass;

  @JsonKey(name: "moves")
  final List<BaseResponseResultsDto> moves;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'pokemon')
  final List<PokemonWithTypeDto> pokemon;

  PokemonTypeChartsDto({
    required this.damageRelationDto,
    required this.id,
    required this.moves,
    this.moveDamageClass,
    required this.name,
    required this.pokemon,
  });

  factory PokemonTypeChartsDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeChartsDtoFromJson(json);

  PokemonTypeDetailedModel toModel() => PokemonTypeDetailedModel(
        id: id,
        name: name,
        damgeRelation: damageRelationDto.toModel(),
        moveDamageClass: moveDamageClass?.name,
        moves: moves.map((e) => e.name).toList(),
        pokemons: pokemon.map((e) => e.pokemon.toPokemonModel()).toList(),
      );

  Map<String, dynamic> toJson() => _$PokemonTypeChartsDtoToJson(this);
}
