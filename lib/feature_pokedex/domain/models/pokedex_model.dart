import 'package:freezed_annotation/freezed_annotation.dart';

import 'models.dart';

part 'pokedex_model.freezed.dart';

@freezed
class PokedexPokemonModel with _$PokedexPokemonModel {
  factory PokedexPokemonModel({
    required List<BaseStatsModel> stats,
    required List<PokedexMoveModel> moves,
    required PokedexPokemonSimplifiedModel simple,
    required bool isDefault,
  }) = _PokedexPokemonModel;
}
