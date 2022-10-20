import 'package:flutter_pokedex/core/data/base_dto/base_response_results_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../models/base_response_model.dart';

part 'base_endpoint_dto.g.dart';

@JsonSerializable()
class BaseEndpointDto {
  @JsonKey(name: "count")
  final int count;
  @JsonKey(name: "previous")
  final String? previous;
  @JsonKey(name: "next")
  final String? next;
  @JsonKey(name: "results")
  final List<BaseResponseResultsDto> results;

  BaseEndpointDto({
    required this.count,
    this.next,
    required this.results,
    this.previous,
  });

  factory BaseEndpointDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BaseEndpointDtoFromJson(json);
  Map<String, dynamic> toJson() => _$BaseEndpointDtoToJson(this);

  PokemonBaseResponse toModel() => PokemonBaseResponse(
      count: count,
      results: results.map((e) => e.toModel()).toList(),
      previous: previous,
      next: next);
}
