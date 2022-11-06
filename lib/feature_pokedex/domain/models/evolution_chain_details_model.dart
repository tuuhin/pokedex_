import 'package:freezed_annotation/freezed_annotation.dart';

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
    required List<EvolutionDetails> details,
    required bool isBaby,
  }) = _EvolutionChain;
}

@freezed
class EvolutionDetails with _$EvolutionDetails {
  factory EvolutionDetails({
    Gender? gender,
    String? heldItemName,
    String? itemName,
    String? location,
    required int minLevel,
    required TimeOfDay timeOfDay,
    required String triggerName,
  }) = _EvolutionDetails;
}

enum TimeOfDay { empty, day, night }

enum Gender { male, female, genderless }
