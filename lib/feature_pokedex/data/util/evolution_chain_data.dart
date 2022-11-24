import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/models.dart';

part 'evolution_chain_data.freezed.dart';

@freezed
class EvolutionChainData with _$EvolutionChainData {
  factory EvolutionChainData.data(EvolutionChainDetailedModel data) = _Data;
  factory EvolutionChainData.loading() = _Loading;
  factory EvolutionChainData.error(Object err, StackTrace stk) = _Error;
  factory EvolutionChainData.absent(String message) = _Absent;
}
