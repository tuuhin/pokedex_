class PokemonMoveDetailed {
  final int? accuracy;
  final int id;
  final String name;
  final int? power;
  final int pp;
  final int priority;
  final String moveType;
  final List<LearnedByPokemon> learnedByPokemon;

  final DamageClass damageClass;

  final List<EffectEntries> effectEntries;

  final List<FlavourText> flavourText;

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
    required this.effectEntries,
    required this.flavourText,
  });
}

class DamageClass {
  final String name;
  DamageClass({required this.name});
}

class FlavourText {
  final String flavourText;
  FlavourText({required this.flavourText});
}

class EffectEntries {
  final String effect;
  final String? shortEffect;
  EffectEntries({required this.effect, this.shortEffect});
}

class LearnedByPokemon {
  final String name;
  final String url;
  LearnedByPokemon({required this.name, required this.url});
}
