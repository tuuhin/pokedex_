import 'package:json_annotation/json_annotation.dart';

part 'base_endpoint_dto.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseEndpointDto<T> {
  @JsonKey(name: "count")
  final int count;
  @JsonKey(name: "previous")
  final String? previous;
  @JsonKey(name: "next")
  final String? next;
  @JsonKey(name: "results")
  final List<T> results;

  BaseEndpointDto(
      {required this.count, this.next, required this.results, this.previous});

  factory BaseEndpointDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseEndpointDtoFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseEndpointDtoToJson(this, toJsonT);
}
