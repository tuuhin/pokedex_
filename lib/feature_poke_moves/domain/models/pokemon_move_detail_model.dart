class PokemonMoveDetailed {
  final int accuracy;
  final int id;
  final String name;
  final int power;
  final int pp;
  final int priority;

  final DamageClass damageClass;

  final List<EffectEntries> effectEntries;

  final List<FlavourText> flavourText;

  PokemonMoveDetailed({
    required this.id,
    required this.name,
    required this.power,
    required this.pp,
    required this.priority,
    required this.accuracy,
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

class PokeMonType {
  final String name;
  PokeMonType({required this.name});
}

class EffectEntries {
  final String effect;
  final String? shortEffect;
  EffectEntries({required this.effect, this.shortEffect});
}

class PokeMonWithMove {
  final String name;
  final String url;
  PokeMonWithMove({required this.name, required this.url});
}
