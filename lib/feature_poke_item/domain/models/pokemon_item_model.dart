import 'package:flutter_pokedex/core/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'pokemon_item_model.freezed.dart';

@freezed
class PokemonItemModel with _$PokemonItemModel {
  factory PokemonItemModel({
    required List<String> attributes,
    required String category,
    required int cost,
    required List<PokemonEffectEntriesModel> effects,
    required List<PokemonFlavourTextModel> flavorEntries,
    int? fillingEffect,
    int? fillingPower,
    required String name,
    required String imageUrl,
  }) = _PokemonItemModel;
}
