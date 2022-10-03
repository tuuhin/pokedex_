import '../domain.dart';

abstract class PokemonMoveRespository {
  Future<PokemonMove> getMoves({int? offset, int? limit});
  Future<List<PokemonMoveDetailed>> getDetailedMove(
      List<PokemonMoveSimplified> results);
}
