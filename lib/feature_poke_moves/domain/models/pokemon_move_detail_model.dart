class PokemonMoveDetailed {
  final int? accuracy;
  final int id;
  final String name;
  final int? power;
  final int pp;
  final int priority;
  final String moveType;
  final List<LearnedByPokemon> learnedByPokemon;

  final String damageClass;

  final String effect;

  final String flavourText;

  PokemonMoveDetailed({
    required this.moveType,
    required this.learnedByPokemon,
    required this.id,
    required this.name,
    this.power,
    required this.pp,
    required this.priority,
    this.accuracy,
    required this.damageClass,
    required this.effect,
    required this.flavourText,
  });
}

class LearnedByPokemon {
  final String name;
  final String url;
  final String? imageURL;
  LearnedByPokemon({required this.name, required this.url, this.imageURL});
}
