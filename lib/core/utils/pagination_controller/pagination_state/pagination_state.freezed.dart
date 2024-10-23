// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaginationState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> items) data,
    required TResult Function() loading,
    required TResult Function(Object? error, StackTrace? stk) error,
    required TResult Function(List<T> items) onGoingLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<T> items)? data,
    TResult? Function()? loading,
    TResult? Function(Object? error, StackTrace? stk)? error,
    TResult? Function(List<T> items)? onGoingLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> items)? data,
    TResult Function()? loading,
    TResult Function(Object? error, StackTrace? stk)? error,
    TResult Function(List<T> items)? onGoingLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataPaginationState<T> value) data,
    required TResult Function(LoadingPaginationState<T> value) loading,
    required TResult Function(_ErrorPaginationState<T> value) error,
    required TResult Function(OnGoingLoadingState<T> value) onGoingLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataPaginationState<T> value)? data,
    TResult? Function(LoadingPaginationState<T> value)? loading,
    TResult? Function(_ErrorPaginationState<T> value)? error,
    TResult? Function(OnGoingLoadingState<T> value)? onGoingLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataPaginationState<T> value)? data,
    TResult Function(LoadingPaginationState<T> value)? loading,
    TResult Function(_ErrorPaginationState<T> value)? error,
    TResult Function(OnGoingLoadingState<T> value)? onGoingLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationStateCopyWith<T, $Res> {
  factory $PaginationStateCopyWith(
          PaginationState<T> value, $Res Function(PaginationState<T>) then) =
      _$PaginationStateCopyWithImpl<T, $Res, PaginationState<T>>;
}

/// @nodoc
class _$PaginationStateCopyWithImpl<T, $Res, $Val extends PaginationState<T>>
    implements $PaginationStateCopyWith<T, $Res> {
  _$PaginationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DataPaginationStateImplCopyWith<T, $Res> {
  factory _$$DataPaginationStateImplCopyWith(_$DataPaginationStateImpl<T> value,
          $Res Function(_$DataPaginationStateImpl<T>) then) =
      __$$DataPaginationStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<T> items});
}

/// @nodoc
class __$$DataPaginationStateImplCopyWithImpl<T, $Res>
    extends _$PaginationStateCopyWithImpl<T, $Res, _$DataPaginationStateImpl<T>>
    implements _$$DataPaginationStateImplCopyWith<T, $Res> {
  __$$DataPaginationStateImplCopyWithImpl(_$DataPaginationStateImpl<T> _value,
      $Res Function(_$DataPaginationStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$DataPaginationStateImpl<T>(
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$DataPaginationStateImpl<T> implements _DataPaginationState<T> {
  const _$DataPaginationStateImpl(final List<T> items) : _items = items;

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'PaginationState<$T>.data(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataPaginationStateImpl<T> &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataPaginationStateImplCopyWith<T, _$DataPaginationStateImpl<T>>
      get copyWith => __$$DataPaginationStateImplCopyWithImpl<T,
          _$DataPaginationStateImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> items) data,
    required TResult Function() loading,
    required TResult Function(Object? error, StackTrace? stk) error,
    required TResult Function(List<T> items) onGoingLoading,
  }) {
    return data(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<T> items)? data,
    TResult? Function()? loading,
    TResult? Function(Object? error, StackTrace? stk)? error,
    TResult? Function(List<T> items)? onGoingLoading,
  }) {
    return data?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> items)? data,
    TResult Function()? loading,
    TResult Function(Object? error, StackTrace? stk)? error,
    TResult Function(List<T> items)? onGoingLoading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataPaginationState<T> value) data,
    required TResult Function(LoadingPaginationState<T> value) loading,
    required TResult Function(_ErrorPaginationState<T> value) error,
    required TResult Function(OnGoingLoadingState<T> value) onGoingLoading,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataPaginationState<T> value)? data,
    TResult? Function(LoadingPaginationState<T> value)? loading,
    TResult? Function(_ErrorPaginationState<T> value)? error,
    TResult? Function(OnGoingLoadingState<T> value)? onGoingLoading,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataPaginationState<T> value)? data,
    TResult Function(LoadingPaginationState<T> value)? loading,
    TResult Function(_ErrorPaginationState<T> value)? error,
    TResult Function(OnGoingLoadingState<T> value)? onGoingLoading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _DataPaginationState<T> implements PaginationState<T> {
  const factory _DataPaginationState(final List<T> items) =
      _$DataPaginationStateImpl<T>;

  List<T> get items;
  @JsonKey(ignore: true)
  _$$DataPaginationStateImplCopyWith<T, _$DataPaginationStateImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingPaginationStateImplCopyWith<T, $Res> {
  factory _$$LoadingPaginationStateImplCopyWith(
          _$LoadingPaginationStateImpl<T> value,
          $Res Function(_$LoadingPaginationStateImpl<T>) then) =
      __$$LoadingPaginationStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingPaginationStateImplCopyWithImpl<T, $Res>
    extends _$PaginationStateCopyWithImpl<T, $Res,
        _$LoadingPaginationStateImpl<T>>
    implements _$$LoadingPaginationStateImplCopyWith<T, $Res> {
  __$$LoadingPaginationStateImplCopyWithImpl(
      _$LoadingPaginationStateImpl<T> _value,
      $Res Function(_$LoadingPaginationStateImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingPaginationStateImpl<T> implements LoadingPaginationState<T> {
  const _$LoadingPaginationStateImpl();

  @override
  String toString() {
    return 'PaginationState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingPaginationStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> items) data,
    required TResult Function() loading,
    required TResult Function(Object? error, StackTrace? stk) error,
    required TResult Function(List<T> items) onGoingLoading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<T> items)? data,
    TResult? Function()? loading,
    TResult? Function(Object? error, StackTrace? stk)? error,
    TResult? Function(List<T> items)? onGoingLoading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> items)? data,
    TResult Function()? loading,
    TResult Function(Object? error, StackTrace? stk)? error,
    TResult Function(List<T> items)? onGoingLoading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataPaginationState<T> value) data,
    required TResult Function(LoadingPaginationState<T> value) loading,
    required TResult Function(_ErrorPaginationState<T> value) error,
    required TResult Function(OnGoingLoadingState<T> value) onGoingLoading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataPaginationState<T> value)? data,
    TResult? Function(LoadingPaginationState<T> value)? loading,
    TResult? Function(_ErrorPaginationState<T> value)? error,
    TResult? Function(OnGoingLoadingState<T> value)? onGoingLoading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataPaginationState<T> value)? data,
    TResult Function(LoadingPaginationState<T> value)? loading,
    TResult Function(_ErrorPaginationState<T> value)? error,
    TResult Function(OnGoingLoadingState<T> value)? onGoingLoading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingPaginationState<T> implements PaginationState<T> {
  const factory LoadingPaginationState() = _$LoadingPaginationStateImpl<T>;
}

/// @nodoc
abstract class _$$ErrorPaginationStateImplCopyWith<T, $Res> {
  factory _$$ErrorPaginationStateImplCopyWith(
          _$ErrorPaginationStateImpl<T> value,
          $Res Function(_$ErrorPaginationStateImpl<T>) then) =
      __$$ErrorPaginationStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Object? error, StackTrace? stk});
}

/// @nodoc
class __$$ErrorPaginationStateImplCopyWithImpl<T, $Res>
    extends _$PaginationStateCopyWithImpl<T, $Res,
        _$ErrorPaginationStateImpl<T>>
    implements _$$ErrorPaginationStateImplCopyWith<T, $Res> {
  __$$ErrorPaginationStateImplCopyWithImpl(_$ErrorPaginationStateImpl<T> _value,
      $Res Function(_$ErrorPaginationStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? stk = freezed,
  }) {
    return _then(_$ErrorPaginationStateImpl<T>(
      freezed == error ? _value.error : error,
      freezed == stk
          ? _value.stk
          : stk // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$ErrorPaginationStateImpl<T> implements _ErrorPaginationState<T> {
  const _$ErrorPaginationStateImpl(this.error, this.stk);

  @override
  final Object? error;
  @override
  final StackTrace? stk;

  @override
  String toString() {
    return 'PaginationState<$T>.error(error: $error, stk: $stk)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorPaginationStateImpl<T> &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stk, stk) || other.stk == stk));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error), stk);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorPaginationStateImplCopyWith<T, _$ErrorPaginationStateImpl<T>>
      get copyWith => __$$ErrorPaginationStateImplCopyWithImpl<T,
          _$ErrorPaginationStateImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> items) data,
    required TResult Function() loading,
    required TResult Function(Object? error, StackTrace? stk) error,
    required TResult Function(List<T> items) onGoingLoading,
  }) {
    return error(this.error, stk);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<T> items)? data,
    TResult? Function()? loading,
    TResult? Function(Object? error, StackTrace? stk)? error,
    TResult? Function(List<T> items)? onGoingLoading,
  }) {
    return error?.call(this.error, stk);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> items)? data,
    TResult Function()? loading,
    TResult Function(Object? error, StackTrace? stk)? error,
    TResult Function(List<T> items)? onGoingLoading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, stk);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataPaginationState<T> value) data,
    required TResult Function(LoadingPaginationState<T> value) loading,
    required TResult Function(_ErrorPaginationState<T> value) error,
    required TResult Function(OnGoingLoadingState<T> value) onGoingLoading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataPaginationState<T> value)? data,
    TResult? Function(LoadingPaginationState<T> value)? loading,
    TResult? Function(_ErrorPaginationState<T> value)? error,
    TResult? Function(OnGoingLoadingState<T> value)? onGoingLoading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataPaginationState<T> value)? data,
    TResult Function(LoadingPaginationState<T> value)? loading,
    TResult Function(_ErrorPaginationState<T> value)? error,
    TResult Function(OnGoingLoadingState<T> value)? onGoingLoading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorPaginationState<T> implements PaginationState<T> {
  const factory _ErrorPaginationState(
          final Object? error, final StackTrace? stk) =
      _$ErrorPaginationStateImpl<T>;

  Object? get error;
  StackTrace? get stk;
  @JsonKey(ignore: true)
  _$$ErrorPaginationStateImplCopyWith<T, _$ErrorPaginationStateImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnGoingLoadingStateImplCopyWith<T, $Res> {
  factory _$$OnGoingLoadingStateImplCopyWith(_$OnGoingLoadingStateImpl<T> value,
          $Res Function(_$OnGoingLoadingStateImpl<T>) then) =
      __$$OnGoingLoadingStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<T> items});
}

/// @nodoc
class __$$OnGoingLoadingStateImplCopyWithImpl<T, $Res>
    extends _$PaginationStateCopyWithImpl<T, $Res, _$OnGoingLoadingStateImpl<T>>
    implements _$$OnGoingLoadingStateImplCopyWith<T, $Res> {
  __$$OnGoingLoadingStateImplCopyWithImpl(_$OnGoingLoadingStateImpl<T> _value,
      $Res Function(_$OnGoingLoadingStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$OnGoingLoadingStateImpl<T>(
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$OnGoingLoadingStateImpl<T> implements OnGoingLoadingState<T> {
  const _$OnGoingLoadingStateImpl(final List<T> items) : _items = items;

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'PaginationState<$T>.onGoingLoading(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnGoingLoadingStateImpl<T> &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnGoingLoadingStateImplCopyWith<T, _$OnGoingLoadingStateImpl<T>>
      get copyWith => __$$OnGoingLoadingStateImplCopyWithImpl<T,
          _$OnGoingLoadingStateImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> items) data,
    required TResult Function() loading,
    required TResult Function(Object? error, StackTrace? stk) error,
    required TResult Function(List<T> items) onGoingLoading,
  }) {
    return onGoingLoading(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<T> items)? data,
    TResult? Function()? loading,
    TResult? Function(Object? error, StackTrace? stk)? error,
    TResult? Function(List<T> items)? onGoingLoading,
  }) {
    return onGoingLoading?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> items)? data,
    TResult Function()? loading,
    TResult Function(Object? error, StackTrace? stk)? error,
    TResult Function(List<T> items)? onGoingLoading,
    required TResult orElse(),
  }) {
    if (onGoingLoading != null) {
      return onGoingLoading(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataPaginationState<T> value) data,
    required TResult Function(LoadingPaginationState<T> value) loading,
    required TResult Function(_ErrorPaginationState<T> value) error,
    required TResult Function(OnGoingLoadingState<T> value) onGoingLoading,
  }) {
    return onGoingLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataPaginationState<T> value)? data,
    TResult? Function(LoadingPaginationState<T> value)? loading,
    TResult? Function(_ErrorPaginationState<T> value)? error,
    TResult? Function(OnGoingLoadingState<T> value)? onGoingLoading,
  }) {
    return onGoingLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataPaginationState<T> value)? data,
    TResult Function(LoadingPaginationState<T> value)? loading,
    TResult Function(_ErrorPaginationState<T> value)? error,
    TResult Function(OnGoingLoadingState<T> value)? onGoingLoading,
    required TResult orElse(),
  }) {
    if (onGoingLoading != null) {
      return onGoingLoading(this);
    }
    return orElse();
  }
}

abstract class OnGoingLoadingState<T> implements PaginationState<T> {
  const factory OnGoingLoadingState(final List<T> items) =
      _$OnGoingLoadingStateImpl<T>;

  List<T> get items;
  @JsonKey(ignore: true)
  _$$OnGoingLoadingStateImplCopyWith<T, _$OnGoingLoadingStateImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
