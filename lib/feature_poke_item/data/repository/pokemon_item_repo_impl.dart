import 'package:flutter_pokedex/feature_poke_item/data/remote/pokemon_item_client.dart';

import '../../../core/data/base_dto/base_endpoint_dto.dart';
import '../../../core/models/base_response_model.dart';
import '../../../core/models/base_response_results_model.dart';
import '../../../core/util/dio_client.dart';
import '../../../core/util/string_helper.dart';
import '../../domain/models/pokemon_item_model.dart';
import '../../domain/repository/pokemon_item_repository.dart';
import '../remote/dto/pokemon_item_dto.dart';

class PokemonItemRepositoryImpl implements PokemonItemRepository {
  final PokemonItemClient _client = PokemonItemClient(dio);
  @override
  Future<PokemonBaseResponse> getItems({int? offset, int? limit}) async {
    BaseEndpointDto itemsBase =
        await _client.getItems(offset: offset, limit: limit);
    return itemsBase.toModel();
  }

  @override
  Future<List<PokemonItemModel>> getItemsDetails(
      List<BaseResponseResults> results) async {
    Iterable<int> ids = results.map((e) => getIdFromString(e.url));
    Iterable<PokemonItemDto> items = await Future.wait(
        ids.map((id) => _client.getItemDetailed(id: id)),
        eagerError: true);
    return items.map((e) => e.toModel()).toList();
  }
}
