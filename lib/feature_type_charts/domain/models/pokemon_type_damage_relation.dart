import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_type_damage_relation.freezed.dart';

@freezed
class PokemonDamgeRelationModel with _$PokemonDamgeRelationModel {
  factory PokemonDamgeRelationModel({
    required List<String> doubleDamageFrom,
    required List<String> doubleDamageTo,
    required List<String> noDamageTo,
    required List<String> noDamageFrom,
  }) = _PokemonDamgeRelationModel;
}
