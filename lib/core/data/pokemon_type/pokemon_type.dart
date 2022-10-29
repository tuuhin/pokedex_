import 'package:flutter/material.dart';

class PokeMonType {
  final String type;
  final Color primaryColor;
  final Color secondaryColor;

  const PokeMonType({
    required this.type,
    required this.primaryColor,
    required this.secondaryColor,
  });

  static PokeMonType getPokeMonTypeById(int typeId) {
    Map<int, PokeMonType> map = {
      1: PokeMonType._normal(),
      2: PokeMonType._fighting(),
      3: PokeMonType._flying(),
      4: PokeMonType._poison(),
      5: PokeMonType._ground(),
      6: PokeMonType._rock(),
      7: PokeMonType._bug(),
      8: PokeMonType._ghost(),
      9: PokeMonType._steel(),
      10: PokeMonType._fire(),
      11: PokeMonType._water(),
      12: PokeMonType._grass(),
      13: PokeMonType._electric(),
      14: PokeMonType._psychic(),
      15: PokeMonType._ice(),
      16: PokeMonType._dragon(),
      17: PokeMonType._dark(),
      18: PokeMonType._fairy(),
      10002: PokeMonType._shadow()
    };
    return map[typeId] ?? PokeMonType._unknown();
  }

  static PokeMonType getPokeMonTypeByName(String name) {
    Map<String, PokeMonType> map = {
      "normal": PokeMonType._normal(),
      "fighting": PokeMonType._fighting(),
      "flying": PokeMonType._flying(),
      "poison": PokeMonType._poison(),
      "ground": PokeMonType._ground(),
      "rock": PokeMonType._rock(),
      "bug": PokeMonType._bug(),
      "ghost": PokeMonType._ghost(),
      "steel": PokeMonType._steel(),
      "fire": PokeMonType._fire(),
      "water": PokeMonType._water(),
      "grass": PokeMonType._grass(),
      "electric": PokeMonType._electric(),
      "psychic": PokeMonType._psychic(),
      "ice": PokeMonType._ice(),
      "dragon": PokeMonType._dragon(),
      "dark": PokeMonType._dark(),
      "fairy": PokeMonType._fairy(),
      "shadow": PokeMonType._shadow()
    };
    return map[name] ?? PokeMonType._unknown();
  }

  factory PokeMonType._normal() => const PokeMonType(
        type: "Normal",
        primaryColor: Color(0xFFA8A878),
        secondaryColor: Color(0xFF6D6D4E),
      );
  factory PokeMonType._fire() => const PokeMonType(
        type: "Fire",
        primaryColor: Color(0xFFF08030),
        secondaryColor: Color(0xFF9C531F),
      );
  factory PokeMonType._flying() => const PokeMonType(
        type: "Flying",
        primaryColor: Color(0xFFA890F0),
        secondaryColor: Color(0xFF6D5E9C),
      );
  factory PokeMonType._water() => const PokeMonType(
        type: "Water",
        primaryColor: Color(0xFF6890F0),
        secondaryColor: Color(0xFF445E9C),
      );
  factory PokeMonType._fighting() => const PokeMonType(
        type: "Fighting",
        primaryColor: Color(0xFFC03028),
        secondaryColor: Color(0xFF7D1F1A),
      );
  factory PokeMonType._grass() => const PokeMonType(
        type: "Grass",
        primaryColor: Color(0xFFA7DB8D),
        secondaryColor: Color(0xFF78C850),
      );
  factory PokeMonType._poison() => const PokeMonType(
        type: "Poison",
        primaryColor: Color(0xFFA040A0),
        secondaryColor: Color(0xFF682A68),
      );
  factory PokeMonType._electric() => const PokeMonType(
        type: "Electric",
        primaryColor: Color(0xFFF8D030),
        secondaryColor: Color(0xFFA1871F),
      );
  factory PokeMonType._ground() => const PokeMonType(
      type: "Ground",
      primaryColor: Color(0xFFE0C068),
      secondaryColor: Color(0xFF927D44));
  factory PokeMonType._psychic() => const PokeMonType(
      type: "Psychic",
      primaryColor: Color(0xFFF85888),
      secondaryColor: Color(0xFFA13959));
  factory PokeMonType._rock() => const PokeMonType(
        type: "Rock",
        primaryColor: Color(0xFFB8A038),
        secondaryColor: Color(0xFF786824),
      );
  factory PokeMonType._ice() => const PokeMonType(
        type: "Ice",
        primaryColor: Color(0xFF98D8D8),
        secondaryColor: Color(0xFF638D8D),
      );
  factory PokeMonType._bug() => const PokeMonType(
        type: "Bug",
        primaryColor: Color(0xFFA8B820),
        secondaryColor: Color(0xFF6D7815),
      );
  factory PokeMonType._dragon() => const PokeMonType(
      type: "Dragon",
      primaryColor: Color(0xFF7038F8),
      secondaryColor: Color(0xFF4924A1));
  factory PokeMonType._ghost() => const PokeMonType(
        type: "Ghost",
        primaryColor: Color(0xFF705898),
        secondaryColor: Color(0xFF493963),
      );
  factory PokeMonType._dark() => const PokeMonType(
      type: "Dark",
      primaryColor: Color(0xFF705848),
      secondaryColor: Color(0xFF49392F));
  factory PokeMonType._steel() => const PokeMonType(
        type: "Steel",
        primaryColor: Color(0xFFB8B8D0),
        secondaryColor: Color(0xFF787887),
      );
  factory PokeMonType._fairy() => const PokeMonType(
        type: "Fairy",
        primaryColor: Color(0xFFEE99AC),
        secondaryColor: Color(0xFF9B6470),
      );
  factory PokeMonType._unknown() => const PokeMonType(
        type: "Unknown",
        primaryColor: Color(0xFF68A090),
        secondaryColor: Color(0xFF44685E),
      );
  factory PokeMonType._shadow() => const PokeMonType(
        type: 'Shadow',
        primaryColor: Color(0xff604E82),
        secondaryColor: Color(0xff978CAE),
      );
}
