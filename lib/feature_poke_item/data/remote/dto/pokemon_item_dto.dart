import 'package:json_annotation/json_annotation.dart';

import '../../../../core/data/base_dto/base_pokemon_dto.dart';
import '../../../../core/data/base_dto/pokemon_effect_entries_dto.dart';
import '../../../../core/data/base_dto/pokemon_flavour_text_dto.dart';
import '../../../domain/models/pokemon_item_model.dart';

part 'pokemon_item_dto.g.dart';

@JsonSerializable()
class PokemonItemDto {
  @JsonKey(name: 'attributes')
  final List<BasePokemonDto> attrs;
  @JsonKey(name: 'category')
  final BasePokemonDto category;

  @JsonKey(name: 'cost')
  final int cost;
  @JsonKey(name: 'effect_entries')
  final List<PokemonEffectDto> effectEntries;

  @JsonKey(name: 'flavor_text_entries')
  final List<PokemonFlavourTextDto> flavorText;

  @JsonKey(name: 'filling_effect')
  final int? fillingEffect;

  @JsonKey(name: 'filling_power')
  final int? fillingPower;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'sprites')
  final PokemonItemSpriteDto sprite;

  PokemonItemDto({
    required this.attrs,
    required this.category,
    required this.cost,
    required this.effectEntries,
    this.fillingEffect,
    this.fillingPower,
    required this.name,
    required this.flavorText,
    required this.sprite,
  });

  factory PokemonItemDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonItemDtoToJson(this);

  PokemonItemModel toModel() => PokemonItemModel(
      attributes: attrs.map((e) => e.name).toList(),
      category: category.name,
      cost: cost,
      fillingEffect: fillingEffect,
      fillingPower: fillingPower,
      effects: effectEntries.map((e) => e.toModel()).toList(),
      flavorEntries: flavorText
          .where((element) => element.language.name == 'en')
          .map((e) => e.toModel())
          .toList(),
      name: name,
      imageUrl: sprite.imageUrl);
}

@JsonSerializable()
class PokemonItemSpriteDto {
  @JsonKey(name: "default")
  final String imageUrl;

  PokemonItemSpriteDto({required this.imageUrl});

  factory PokemonItemSpriteDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonItemSpriteDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonItemSpriteDtoToJson(this);
}
