import 'package:json_annotation/json_annotation.dart';
part 'pokemon_moves_dto.g.dart';

@JsonSerializable()
class PokemonMovesDto {
  final int accuracy;
  final int id;
  final String name;
  final int power;
  final int pp;
  final int priority;
  @JsonKey(name: "damage_class")
  final DamageClassDto damageClass;
  @JsonKey(name: "effect_entries")
  final List<EffectEntriesDto> effectEntries;
  @JsonKey(name: "flavor_text_entries")
  final List<FlavourTextDto> flavourText;

  PokemonMovesDto({
    required this.id,
    required this.name,
    required this.power,
    required this.pp,
    required this.priority,
    required this.accuracy,
    required this.damageClass,
    required this.effectEntries,
    required this.flavourText,
  });

  factory PokemonMovesDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonMovesDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonMovesDtoToJson(this);
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
class PokeMonTypeDto {
  final String name;
  PokeMonTypeDto({required this.name});
  factory PokeMonTypeDto.fromJson(Map<String, dynamic> json) =>
      _$PokeMonTypeDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokeMonTypeDtoToJson(this);
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
class PokeMonWithMoveDto {
  final String name;
  final String url;

  PokeMonWithMoveDto({required this.name, required this.url});

  void init() {
    String imageUrl = url.substring(0, url.length - 1);
    imageUrl =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${imageUrl.split("/").last}.png';
  }

  factory PokeMonWithMoveDto.fromJson(Map<String, dynamic> json) =>
      _$PokeMonWithMoveDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokeMonWithMoveDtoToJson(this);
}
