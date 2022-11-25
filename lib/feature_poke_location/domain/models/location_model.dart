import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';

@freezed
class LocationModel with _$LocationModel {
  factory LocationModel({
    required String regionName,
    required List<String> locations,
    @Default('unknown') String? gen,
  }) = _LocationModel;
}
