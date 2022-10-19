import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response_model.freezed.dart';

@freezed
class PokemonBaseResponse<T> with _$PokemonBaseResponse<T> {
  factory PokemonBaseResponse({
    required int count,
    required List<T> results,
    String? previous,
    String? next,
  }) = _PokemonBaseResponse;
}
