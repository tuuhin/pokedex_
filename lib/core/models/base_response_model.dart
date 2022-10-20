import 'package:freezed_annotation/freezed_annotation.dart';

import 'base_response_results_model.dart';

part 'base_response_model.freezed.dart';

@freezed
class PokemonBaseResponse with _$PokemonBaseResponse {
  factory PokemonBaseResponse({
    required int count,
    required List<BaseResponseResults> results,
    String? previous,
    String? next,
  }) = _PokemonBaseResponse;
}
