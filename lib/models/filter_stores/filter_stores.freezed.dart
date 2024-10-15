// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_stores.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FilterStores _$FilterStoresFromJson(Map<String, dynamic> json) {
  return _FilterStores.fromJson(json);
}

/// @nodoc
mixin _$FilterStores {
  String get title => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  /// Serializes this FilterStores to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FilterStores
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterStoresCopyWith<FilterStores> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterStoresCopyWith<$Res> {
  factory $FilterStoresCopyWith(
          FilterStores value, $Res Function(FilterStores) then) =
      _$FilterStoresCopyWithImpl<$Res, FilterStores>;
  @useResult
  $Res call({String title, String id, bool isSelected});
}

/// @nodoc
class _$FilterStoresCopyWithImpl<$Res, $Val extends FilterStores>
    implements $FilterStoresCopyWith<$Res> {
  _$FilterStoresCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterStores
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterStoresImplCopyWith<$Res>
    implements $FilterStoresCopyWith<$Res> {
  factory _$$FilterStoresImplCopyWith(
          _$FilterStoresImpl value, $Res Function(_$FilterStoresImpl) then) =
      __$$FilterStoresImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String id, bool isSelected});
}

/// @nodoc
class __$$FilterStoresImplCopyWithImpl<$Res>
    extends _$FilterStoresCopyWithImpl<$Res, _$FilterStoresImpl>
    implements _$$FilterStoresImplCopyWith<$Res> {
  __$$FilterStoresImplCopyWithImpl(
      _$FilterStoresImpl _value, $Res Function(_$FilterStoresImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilterStores
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = null,
    Object? isSelected = null,
  }) {
    return _then(_$FilterStoresImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterStoresImpl implements _FilterStores {
  const _$FilterStoresImpl(
      {required this.title, required this.id, required this.isSelected});

  factory _$FilterStoresImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilterStoresImplFromJson(json);

  @override
  final String title;
  @override
  final String id;
  @override
  final bool isSelected;

  @override
  String toString() {
    return 'FilterStores(title: $title, id: $id, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterStoresImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, id, isSelected);

  /// Create a copy of FilterStores
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterStoresImplCopyWith<_$FilterStoresImpl> get copyWith =>
      __$$FilterStoresImplCopyWithImpl<_$FilterStoresImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterStoresImplToJson(
      this,
    );
  }
}

abstract class _FilterStores implements FilterStores {
  const factory _FilterStores(
      {required final String title,
      required final String id,
      required final bool isSelected}) = _$FilterStoresImpl;

  factory _FilterStores.fromJson(Map<String, dynamic> json) =
      _$FilterStoresImpl.fromJson;

  @override
  String get title;
  @override
  String get id;
  @override
  bool get isSelected;

  /// Create a copy of FilterStores
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterStoresImplCopyWith<_$FilterStoresImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
