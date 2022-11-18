import 'package:freezed_annotation/freezed_annotation.dart';

import 'models.dart';

part 'pokedex_model.freezed.dart';

@freezed
class PokedexPokemonModel with _$PokedexPokemonModel {
  factory PokedexPokemonModel({
    required int id,
    required List<BaseStatsModel> stats,
    required List<PokedexMoveModel> moves,
    required PokedexPokemonSimplifiedModel simple,
    required bool isDefault,
    required int height,
    required int weight,
    required Iterable<String> abilities,
    @Default(0) int? baseXP,
  }) = _PokedexPokemonModel;
}
