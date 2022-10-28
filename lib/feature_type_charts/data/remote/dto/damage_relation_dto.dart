import 'package:json_annotation/json_annotation.dart';

import '../../../../core/data/base_dto/base_dto.dart';
import '../../../domain/models/pokemon_type_damage_relation.dart';

part 'damage_relation_dto.g.dart';

@JsonSerializable()
class DamageRelationDto {
  @JsonKey(name: 'double_damage_from')
  final List<BaseResponseResultsDto> doubleDamgeFrom;
  @JsonKey(name: 'double_damage_to')
  final List<BaseResponseResultsDto> doubleDamageTo;
  @JsonKey(name: 'no_damage_to')
  final List<BaseResponseResultsDto> noDamageTo;
  @JsonKey(name: 'no_damage_from')
  final List<BaseResponseResultsDto> noDamageFrom;
  @JsonKey(name: 'half_damage_to')
  final List<BaseResponseResultsDto> halfDamageTo;
  @JsonKey(name: 'half_damage_from')
  final List<BaseResponseResultsDto> halfDamageFrom;

  DamageRelationDto({
    required this.noDamageTo,
    required this.noDamageFrom,
    required this.halfDamageTo,
    required this.halfDamageFrom,
    required this.doubleDamgeFrom,
    required this.doubleDamageTo,
  });

  factory DamageRelationDto.fromJson(Map<String, dynamic> json) =>
      _$DamageRelationDtoFromJson(json);

  PokemonDamgeRelationModel toModel() => PokemonDamgeRelationModel(
        doubleDamageFrom: doubleDamgeFrom.map((e) => e.name).toList(),
        doubleDamageTo: doubleDamageTo.map((e) => e.name).toList(),
        noDamageTo: noDamageTo.map((e) => e.name).toList(),
        noDamageFrom: noDamageFrom.map((e) => e.name).toList(),
      );

  Map<String, dynamic> toJson() => _$DamageRelationDtoToJson(this);
}
