import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokedex_move_model.freezed.dart';

@freezed
class PokedexMoveModel with _$PokedexMoveModel {
  factory PokedexMoveModel({
    required String moveName,
    required List<int> learnedAt,
    required List<String> moveLearnMethod,
  }) = _PokedexMoveModel;
}
