import 'package:flutter_pokedex/feature_poke_moves/data/remote/dto/pokemon_move_dto.dart';
import 'package:flutter_pokedex/feature_poke_moves/data/remote/dto/pokemon_moves_dto.dart';

abstract class PokemonMoveRespository {
  Future<PokemonMoveDto> getMoves({int? offset, int? limit});
  Future<PokemonMovesDto> getDetailedMove(int id);
}
