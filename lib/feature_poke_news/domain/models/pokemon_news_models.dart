import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_news_models.freezed.dart';

@freezed
class PokemonNewsModel with _$PokemonNewsModel {
  factory PokemonNewsModel({
    required int id,
    required String title,
    String? shortDescription,
    String? url,
    String? image,
    required String date,
    String? tags,
  }) = _PokeNewsModel;
}
