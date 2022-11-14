import 'package:flutter_pokedex/core/util/string_helper.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/pokemon_news_models.dart';
part 'pokenews_dto.g.dart';

@JsonSerializable()
class PokeNewsDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "shortDescription")
  final String? shortDescription;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "date")
  final String date;
  @JsonKey(name: "tags")
  final String? tags;

  PokeNewsDto({
    required this.id,
    required this.title,
    required this.date,
    this.shortDescription,
    this.url,
    this.image,
    this.tags,
  });

  PokemonNewsModel toModel() => PokemonNewsModel(
      id: id,
      title: tagRemover(title),
      shortDescription: tagRemover(shortDescription ?? ''),
      url: url,
      image: image,
      date: date,
      tags: tags);

  factory PokeNewsDto.fromJson(Map<String, dynamic> json) =>
      _$PokeNewsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PokeNewsDtoToJson(this);
}
