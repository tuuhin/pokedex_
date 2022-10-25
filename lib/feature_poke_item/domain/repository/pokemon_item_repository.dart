import '../../../core/models/base_response_model.dart';
import '../../../core/models/base_response_results_model.dart';
import '../models/pokemon_item_model.dart';

abstract class PokemonItemRepository {
  Future<PokemonBaseResponse> getItems({int? offset, int? limit});
  Future<List<PokemonItemModel>> getItemsDetails(
      List<BaseResponseResults> results);
}
