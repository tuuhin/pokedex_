import 'package:flutter_pokedex/feature_type_charts/domain/models/pokemon_type_damage_relation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/base_pokemon_model.dart';

part 'pokemon_types_detailed_model.freezed.dart';

@freezed
class PokemonTypeDetailedModel with _$PokemonTypeDetailedModel {
  factory PokemonTypeDetailedModel({
    required String name,
    required int id,
    required PokemonDamgeRelationModel damgeRelation,
    required List<String> moves,
    String? moveDamageClass,
    required List<BasePokemonModel> pokemons,
  }) = _PokemonTypeDetailedModel;
}
