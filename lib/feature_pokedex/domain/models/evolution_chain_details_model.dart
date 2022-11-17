import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/remote/remote.dart';

part 'evolution_chain_details_model.freezed.dart';

@freezed
class EvolutionChainDetailedModel with _$EvolutionChainDetailedModel {
  factory EvolutionChainDetailedModel({
    required List<EvolutionChain> chain,
  }) = _EvolutionChainDetailedModel;
}

@freezed
class EvolutionChain with _$EvolutionChain {
  factory EvolutionChain({
    required EvolutionDetails details,
    required String fromSpecies,
    required bool isBaby,
    required String toSpecies,
    required String toSpeciesURL,
    String? fromSpeciesURL,
  }) = _EvolutionChain;
}

@freezed
class EvolutionDetails with _$EvolutionDetails {
  factory EvolutionDetails({
    Gender? gender,
    String? heldItemName,
    String? itemName,
    String? location,
    int? minLevel,
    required TimeOfDay timeOfDay,
    required String triggerName,
  }) = _EvolutionDetails;
}
