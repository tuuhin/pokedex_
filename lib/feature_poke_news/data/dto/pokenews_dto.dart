import 'package:json_annotation/json_annotation.dart';
part 'pokenews_dto.g.dart';

@JsonSerializable()
class PokeNewsDto {
  final int id;
  final String title;
  final String? shortDescription;
  final String? url;
  final String? image;
  final String date;
  final String? tags;

  PokeNewsDto({
    required this.id,
    required this.title,
    this.shortDescription,
    this.url,
    this.image,
    required this.date,
    this.tags,
  });

  factory PokeNewsDto.fromJson(Map<String, dynamic> json) =>
      _$PokeNewsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokeNewsDtoToJson(this);
}
