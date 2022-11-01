import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_simplified_model.freezed.dart';

@freezed
class PokedexPokemonSimplifiedModel with _$PokedexPokemonSimplifiedModel {
  factory PokedexPokemonSimplifiedModel({
    required String name,
    required int pokemonId,
    required List<int> typeIds,
    required String imageUrl,
    required List<String> types,
  }) = _PokedexPokemonSimplifiedModel;
}
