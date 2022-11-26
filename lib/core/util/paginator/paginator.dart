import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginator.freezed.dart';

@freezed
class Paginator<T extends List> with _$Paginator<T> {
  factory Paginator.loading() = Loading;
  factory Paginator.loadMore(T data) = LoadMore;
  factory Paginator.data(T data) = Data;
  factory Paginator.error(Object err, StackTrace? stk) = ErrorDetails;
  factory Paginator.errorLoadMore(T data, Object err, StackTrace? stk) =
      ErrorDetailsMore;
  factory Paginator.end(String message, T data) = PaginatorEnd;
}
