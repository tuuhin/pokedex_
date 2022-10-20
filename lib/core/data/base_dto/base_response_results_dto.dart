import 'package:flutter_pokedex/core/models/base_response_results_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response_results_dto.g.dart';

@JsonSerializable()
class BaseResponseResultsDto {
  final String name;
  final String url;
  BaseResponseResultsDto({required this.name, required this.url});
  factory BaseResponseResultsDto.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseResultsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$BaseResponseResultsDtoToJson(this);

  BaseResponseResults toModel() => BaseResponseResults(name: name, url: url);
}
