import 'package:json_annotation/json_annotation.dart';

part 'pokemon_sprites_dto.g.dart';

@JsonSerializable()
class PokemonSpritesDto {
  @JsonKey(name: "front_default")
  final String? frontDefault;

  @JsonKey(name: "other")
  final DifferentPokemonSpritesDto others;

  PokemonSpritesDto({required this.others, this.frontDefault});

  factory PokemonSpritesDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpritesDtoToJson(this);
}

@JsonSerializable()
class DifferentPokemonSpritesDto {
  @JsonKey(name: "official-artwork")
  final OfficialArtworkSprites officialArtworkSprites;
  @JsonKey(name: "dream_world")
  final DreamWorldSprites dreamWorldSprites;
  @JsonKey(name: "home")
  final HomePokemonSprites homePokemonSprites;

  DifferentPokemonSpritesDto({
    required this.officialArtworkSprites,
    required this.dreamWorldSprites,
    required this.homePokemonSprites,
  });

  factory DifferentPokemonSpritesDto.fromJson(Map<String, dynamic> json) =>
      _$DifferentPokemonSpritesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DifferentPokemonSpritesDtoToJson(this);
}

@JsonSerializable()
class DreamWorldSprites {
  @JsonKey(name: "front_default")
  final String? frontDefault;

  DreamWorldSprites({this.frontDefault});

  factory DreamWorldSprites.fromJson(Map<String, dynamic> json) =>
      _$DreamWorldSpritesFromJson(json);

  Map<String, dynamic> toJson() => _$DreamWorldSpritesToJson(this);
}

@JsonSerializable()
class HomePokemonSprites {
  @JsonKey(name: "front_default")
  final String? frontDefault;
  @JsonKey(name: "front_shiny")
  final String? frontShiny;

  HomePokemonSprites({this.frontDefault, this.frontShiny});

  factory HomePokemonSprites.fromJson(Map<String, dynamic> json) =>
      _$HomePokemonSpritesFromJson(json);

  Map<String, dynamic> toJson() => _$HomePokemonSpritesToJson(this);
}

@JsonSerializable()
class OfficialArtworkSprites {
  @JsonKey(name: "front_default")
  final String frontDefault;

  OfficialArtworkSprites({required this.frontDefault});

  factory OfficialArtworkSprites.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkSpritesFromJson(json);

  Map<String, dynamic> toJson() => _$OfficialArtworkSpritesToJson(this);
}
