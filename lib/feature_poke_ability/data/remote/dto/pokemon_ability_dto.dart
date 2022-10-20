import 'package:flutter_pokedex/feature_poke_ability/domain/models/pokemon_ability.dart';
import 'package:flutter_pokedex/feature_poke_ability/domain/models/pokemon_with_ability_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/data/base_dto/base_dto.dart';

part 'pokemon_ability_dto.g.dart';

@JsonSerializable()
class PokemonAbilityDto {
  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "is_main_series")
  final bool isMainSeries;

  @JsonKey(name: "flavor_text_entries")
  final List<PokemonFlavourTextDto> flavourTextEntries;

  @JsonKey(name: "effect_entries")
  final List<PokemonEffectDto> effectEnties;

  @JsonKey(name: "pokemon")
  final List<PokemonWithAbilityDto> pokemonWithAbility;

  PokemonAbilityDto({
    required this.effectEnties,
    required this.isMainSeries,
    required this.flavourTextEntries,
    required this.name,
    required this.pokemonWithAbility,
  });

  factory PokemonAbilityDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonAbilityDtoToJson(this);

  PokemonAbility toModel() => PokemonAbility(
        name: name,
        pokemon: pokemonWithAbility.map((e) => e.toModel()).toList(),
        flavourText: flavourTextEntries
            .where((element) => element.language.name == 'en')
            .map((e) => e.toModel())
            .toList(),
        effectEntries: effectEnties
            .where((element) => element.language.name == "en")
            .map((e) => e.toModel())
            .toList(),
      );
}

@JsonSerializable()
class PokemonWithAbilityDto {
  @JsonKey(name: "is_hidden")
  final bool isHiddenAbility;
  @JsonKey(name: "pokemon")
  final BasePokemonDto pokemon;
  @JsonKey(name: "slot")
  final int slots;

  PokemonWithAbilityDto({
    required this.isHiddenAbility,
    required this.pokemon,
    required this.slots,
  });

  factory PokemonWithAbilityDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonWithAbilityDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonWithAbilityDtoToJson(this);

  PokemonWithAbility toModel() => PokemonWithAbility(
      hiddenAbility: isHiddenAbility,
      pokemon: pokemon.toPokemonModel(),
      slots: slots);
}
