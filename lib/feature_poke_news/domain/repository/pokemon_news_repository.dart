import '../domain.dart';

abstract class PokemonNewsRepostiory {
  Future<List<PokemonNewsModel>> getNews({int? index, int? count});
}
