import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/util/evolution_chain_data.dart';
import '../domain/models/models.dart';
import '../domain/repository/evolution_chain_repo.dart';

class EvolutionChainNotifier extends StateNotifier<EvolutionChainData> {
  EvolutionChainNotifier(this._repository)
      : super(EvolutionChainData.loading());

  final EvolutionChainRepository _repository;

  void getEvChain(int? pokeId) async {
    if (pokeId == null) {
      state = EvolutionChainData.absent("No evoltuion details found");
      return;
    }
    try {
      EvolutionChainDetailedModel data =
          await _repository.getEvolutionDetials(pokeId);
      state = EvolutionChainData.data(data);
    } on DioError catch (dio, stk) {
      if (dio.response?.statusCode == 404) {
        state = EvolutionChainData.absent("No details found");
      }
      state = EvolutionChainData.error(dio, stk);
    } catch (e, stk) {
      debugPrintStack(stackTrace: stk);
      state = EvolutionChainData.error(e, stk);
    }
  }
}

class EvoltutionIdProvider extends StateNotifier<int?> {
  EvoltutionIdProvider() : super(null);

  int? get evId => state;

  void setId(int? id) => state = id;
}
