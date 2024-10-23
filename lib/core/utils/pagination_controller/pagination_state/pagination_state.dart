import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_state.freezed.dart';

@freezed
abstract class PaginationState<T> with _$PaginationState<T> {
  const factory PaginationState.data(List<T> items) = _DataPaginationState;
  const factory PaginationState.loading() = LoadingPaginationState;
  const factory PaginationState.error(Object? error, StackTrace? stk) =
      _ErrorPaginationState;
  const factory PaginationState.onGoingLoading(List<T> items) =
      OnGoingLoadingState;
}
