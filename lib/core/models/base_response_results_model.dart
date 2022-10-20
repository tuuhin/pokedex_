import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response_results_model.freezed.dart';

@freezed
class BaseResponseResults with _$BaseResponseResults {
  factory BaseResponseResults({
    required String name,
    required String url,
  }) = _BaseResponseResults;
}
