import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/pokemon_news_models.dart';
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

  PokemonNewsModel toModel() => PokemonNewsModel(
      id: id,
      title: title,
      shortDescription: shortDescription,
      url: url,
      image: image,
      date: date,
      tags: tags);

  factory PokeNewsDto.fromJson(Map<String, dynamic> json) =>
      _$PokeNewsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokeNewsDtoToJson(this);
}
