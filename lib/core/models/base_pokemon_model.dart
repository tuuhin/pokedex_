import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_pokemon_model.freezed.dart';

@freezed
class BasePokemonModel with _$BasePokemonModel {
  const BasePokemonModel._();

  const factory BasePokemonModel({
    required String name,
    required String url,
    required String? imageUrl,
  }) = _BasePokemonModel;
}
