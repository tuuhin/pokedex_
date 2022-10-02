import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginator.freezed.dart';

@freezed
class Paginator<T> with _$Paginator<T> {
  factory Paginator.loading() = Loading;
  factory Paginator.loadMore(T data) = LoadingMore;
  factory Paginator.data(T data) = Data;
  factory Paginator.error(Object err, StackTrace stk) = ErrorDetails;
  factory Paginator.errorLoadMore(T date, Object err, StackTrace stk) =
      ErrorDetailsMore;
  factory Paginator.end(String message) = PaginatorEnd;
}
