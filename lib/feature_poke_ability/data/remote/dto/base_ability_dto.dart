import 'package:json_annotation/json_annotation.dart';

part 'base_ability_dto.g.dart';

@JsonSerializable()
class BaseAbilityDto {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "url")
  final String url;
  BaseAbilityDto({required this.name, required this.url});
  factory BaseAbilityDto.fromJson(Map<String, dynamic> json) =>
      _$BaseAbilityDtoFromJson(json);
  Map<String, dynamic> toJson() => _$BaseAbilityDtoToJson(this);
}
