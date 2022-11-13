import 'package:flutter_pokedex/feature_pokedex/domain/models/pokedex_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/util/string_helper.dart';
import '../../../domain/models/pokemon_simplified_model.dart';
import '../remote.dart';

part 'pokedex_pokemon_dto.g.dart';

/// **Info**:Being the  main serializer of the app thus relation
///  with other features are allowed
@JsonSerializable()
class PokedexPokemonDto {
  @JsonKey(name: "abilities")
  final List<PokedexAbilityDto> abilities;
  @JsonKey(name: "base_experience")
  final int? baseXp;
  @JsonKey(name: "height")
  final int height;
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "is_default")
  final bool isDefault;
  @JsonKey(name: "moves")
  final List<PokedexPokemonMove> moves;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "order")
  final int order;
  @JsonKey(name: "stats")
  final List<PokedexPokemonStatsDto> stats;
  @JsonKey(name: "types")
  final List<PokedexPokemonTypeDto> types;
  @JsonKey(name: "weight")
  final int weight;
  @JsonKey(name: "sprites")
  final PokemonSpritesDto sprites;

  PokedexPokemonDto({
    required this.abilities,
    required this.moves,
    required this.name,
    required this.order,
    required this.stats,
    required this.types,
    this.baseXp,
    required this.height,
    required this.id,
    required this.weight,
    required this.isDefault,
    required this.sprites,
  });

  factory PokedexPokemonDto.fromJson(Map<String, dynamic> json) =>
      _$PokedexPokemonDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokedexPokemonDtoToJson(this);

  PokedexPokemonSimplifiedModel toSimpleModel() =>
      PokedexPokemonSimplifiedModel(
        name: name,
        pokemonId: id,
        imageUrl: sprites.others.officialArtworkSprites.frontDefault,
        types: types.map((e) => e.pokemon.name).toList(),
      );

  PokedexPokemonModel toModel() => PokedexPokemonModel(
        stats: stats.map((e) => e.toModel()).toList(),
        moves: moves.map((e) => e.toModel()).toList(),
        simple: toSimpleModel(),
        isDefault: isDefault,
      );
}
