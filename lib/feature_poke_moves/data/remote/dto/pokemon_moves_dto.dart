import 'package:json_annotation/json_annotation.dart';

import '../../../../core/data/base_dto/base_dto.dart';
import '../../../domain/domain.dart';
part 'pokemon_moves_dto.g.dart';

@JsonSerializable()
class PokemonMovesDetailedDto {
  final int? accuracy;
  final int id;
  final String name;
  final int? power;
  final int pp;
  final int priority;
  @JsonKey(name: "damage_class")
  final DamageClassDto damageClass;
  @JsonKey(name: "effect_entries")
  final List<PokemonEffectDto> effectEntries;
  @JsonKey(name: "flavor_text_entries")
  final List<PokemonFlavourTextDto> flavourText;
  @JsonKey(name: "type")
  final BasePokemonDto learnedByTypeDto;
  @JsonKey(name: "learned_by_pokemon")
  final List<BasePokemonDto> learnedByPokemon;

  PokemonMovesDetailedDto(
      {required this.id,
      required this.name,
      this.power,
      required this.pp,
      required this.priority,
      this.accuracy,
      required this.damageClass,
      required this.effectEntries,
      required this.flavourText,
      required this.learnedByTypeDto,
      required this.learnedByPokemon});

  factory PokemonMovesDetailedDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonMovesDetailedDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonMovesDetailedDtoToJson(this);

  PokemonMoveDetailed toMove() => PokemonMoveDetailed(
        id: id,
        name: name,
        power: power,
        pp: pp,
        moveType: learnedByTypeDto.name,
        learnedByPokemon:
            learnedByPokemon.map((e) => e.toPokemonModel()).toList(),
        priority: priority,
        accuracy: accuracy,
        damageClass: damageClass.name,
        effect: effectEntries.map((e) => e.toModel()).toList(),
        flavourText: flavourText.map((e) => e.toModel()).toList(),
      );
}

@JsonSerializable()
class DamageClassDto {
  final String name;
  DamageClassDto({required this.name});
  factory DamageClassDto.fromJson(Map<String, dynamic> json) =>
      _$DamageClassDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DamageClassDtoToJson(this);
}
