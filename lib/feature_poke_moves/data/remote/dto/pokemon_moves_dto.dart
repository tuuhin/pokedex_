import 'package:flutter_pokedex/core/util/string_helper.dart';
import 'package:flutter_pokedex/feature_poke_moves/domain/models/pokemon_move_detail_model.dart';
// import 'package:flutter_pokedex/feature_poke_moves/domain/models/pokemon_move_simplified_model.dart';
import 'package:json_annotation/json_annotation.dart';
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
  final List<EffectEntriesDto> effectEntries;
  @JsonKey(name: "flavor_text_entries")
  final List<FlavourTextDto> flavourText;
  @JsonKey(name: "type")
  final LearnedByTypeDto learnedByTypeDto;
  @JsonKey(name: "learned_by_pokemon")
  final List<LearnedByPokemonDto> learnedByPokemon;

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
        learnedByPokemon: learnedByPokemon.map((e) => e.toModel()).toList(),
        priority: priority,
        accuracy: accuracy,
        damageClass: damageClass.name,
        effect: removeSpecialChars(
            effectEntries.first.shortEffect ?? effectEntries.first.effect),
        flavourText: removeSpecialChars(flavourText.first.flavourText),
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

@JsonSerializable()
class FlavourTextDto {
  @JsonKey(name: "flavor_text")
  final String flavourText;
  FlavourTextDto({required this.flavourText});
  factory FlavourTextDto.fromJson(Map<String, dynamic> json) =>
      _$FlavourTextDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FlavourTextDtoToJson(this);
}

@JsonSerializable()
class EffectEntriesDto {
  final String effect;
  @JsonKey(name: "short_effect")
  final String? shortEffect;
  EffectEntriesDto({required this.effect, this.shortEffect});

  factory EffectEntriesDto.fromJson(Map<String, dynamic> json) =>
      _$EffectEntriesDtoFromJson(json);
  Map<String, dynamic> toJson() => _$EffectEntriesDtoToJson(this);
}

@JsonSerializable()
class LearnedByTypeDto {
  final String name;
  LearnedByTypeDto({required this.name});

  factory LearnedByTypeDto.fromJson(Map<String, dynamic> json) =>
      _$LearnedByTypeDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LearnedByTypeDtoToJson(this);
}

@JsonSerializable()
class LearnedByPokemonDto {
  final String name;
  final String url;
  String? imageURL;

  LearnedByPokemonDto({required this.name, required this.url, this.imageURL}) {
    int id = getIdFromString(url) ?? 1;
    imageURL =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }
  factory LearnedByPokemonDto.fromJson(Map<String, dynamic> json) =>
      _$LearnedByPokemonDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LearnedByPokemonDtoToJson(this);

  LearnedByPokemon toModel() =>
      LearnedByPokemon(name: name, url: url, imageURL: imageURL);
}
