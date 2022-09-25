class PokemonMove {
  final String? nextURL;
  final String? previousURL;
  final List<PokemonMoveSimplified> results;
  PokemonMove({this.nextURL, this.previousURL, required this.results});
}

class PokemonMoveSimplified {
  final String name;
  final String url;
  PokemonMoveSimplified({required this.name, required this.url});
}
