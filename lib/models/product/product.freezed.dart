// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String get image => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get nameStore => throw _privateConstructorUsedError;
  String get imageStore => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {String image,
      String price,
      String description,
      String nameStore,
      String imageStore});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? price = null,
    Object? description = null,
    Object? nameStore = null,
    Object? imageStore = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      nameStore: null == nameStore
          ? _value.nameStore
          : nameStore // ignore: cast_nullable_to_non_nullable
              as String,
      imageStore: null == imageStore
          ? _value.imageStore
          : imageStore // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String image,
      String price,
      String description,
      String nameStore,
      String imageStore});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? price = null,
    Object? description = null,
    Object? nameStore = null,
    Object? imageStore = null,
  }) {
    return _then(_$ProductImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      nameStore: null == nameStore
          ? _value.nameStore
          : nameStore // ignore: cast_nullable_to_non_nullable
              as String,
      imageStore: null == imageStore
          ? _value.imageStore
          : imageStore // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {required this.image,
      required this.price,
      required this.description,
      required this.nameStore,
      required this.imageStore});

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final String image;
  @override
  final String price;
  @override
  final String description;
  @override
  final String nameStore;
  @override
  final String imageStore;

  @override
  String toString() {
    return 'Product(image: $image, price: $price, description: $description, nameStore: $nameStore, imageStore: $imageStore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.nameStore, nameStore) ||
                other.nameStore == nameStore) &&
            (identical(other.imageStore, imageStore) ||
                other.imageStore == imageStore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, image, price, description, nameStore, imageStore);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {required final String image,
      required final String price,
      required final String description,
      required final String nameStore,
      required final String imageStore}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  String get image;
  @override
  String get price;
  @override
  String get description;
  @override
  String get nameStore;
  @override
  String get imageStore;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
