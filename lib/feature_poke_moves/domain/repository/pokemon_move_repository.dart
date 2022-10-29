import 'package:flutter_pokedex/core/models/base_response_model.dart';
import 'package:flutter_pokedex/core/models/base_response_results_model.dart';

import '../domain.dart';

abstract class PokemonMoveRespository {
  Future<PokemonBaseResponse> getMoves({int? offset, int? limit});
  Future<List<PokemonMoveDetailed>> getDetailedMove(
      List<BaseResponseResults> results);
}
