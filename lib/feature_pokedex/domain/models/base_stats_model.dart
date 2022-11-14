import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_stats_model.freezed.dart';

@freezed
class BaseStatsModel with _$BaseStatsModel {
  factory BaseStatsModel({
    required String name,
    required double baseStat,
    required double effort,
  }) = _BaseStatsModel;
}
