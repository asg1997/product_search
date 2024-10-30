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

/// @nodoc
mixin _$Product {
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  String? get storeLogo => throw _privateConstructorUsedError;
  double get similarity => throw _privateConstructorUsedError;
  String get urlId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {String name,
      String image,
      String price,
      String storeName,
      String? storeLogo,
      double similarity,
      String urlId});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
    Object? price = null,
    Object? storeName = null,
    Object? storeLogo = freezed,
    Object? similarity = null,
    Object? urlId = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      storeLogo: freezed == storeLogo
          ? _value.storeLogo
          : storeLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      similarity: null == similarity
          ? _value.similarity
          : similarity // ignore: cast_nullable_to_non_nullable
              as double,
      urlId: null == urlId
          ? _value.urlId
          : urlId // ignore: cast_nullable_to_non_nullable
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
      {String name,
      String image,
      String price,
      String storeName,
      String? storeLogo,
      double similarity,
      String urlId});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
    Object? price = null,
    Object? storeName = null,
    Object? storeLogo = freezed,
    Object? similarity = null,
    Object? urlId = null,
  }) {
    return _then(_$ProductImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      storeLogo: freezed == storeLogo
          ? _value.storeLogo
          : storeLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      similarity: null == similarity
          ? _value.similarity
          : similarity // ignore: cast_nullable_to_non_nullable
              as double,
      urlId: null == urlId
          ? _value.urlId
          : urlId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {required this.name,
      required this.image,
      required this.price,
      required this.storeName,
      required this.storeLogo,
      required this.similarity,
      required this.urlId});

  @override
  final String name;
  @override
  final String image;
  @override
  final String price;
  @override
  final String storeName;
  @override
  final String? storeLogo;
  @override
  final double similarity;
  @override
  final String urlId;

  @override
  String toString() {
    return 'Product(name: $name, image: $image, price: $price, storeName: $storeName, storeLogo: $storeLogo, similarity: $similarity, urlId: $urlId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.storeLogo, storeLogo) ||
                other.storeLogo == storeLogo) &&
            (identical(other.similarity, similarity) ||
                other.similarity == similarity) &&
            (identical(other.urlId, urlId) || other.urlId == urlId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, image, price, storeName, storeLogo, similarity, urlId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);
}

abstract class _Product implements Product {
  const factory _Product(
      {required final String name,
      required final String image,
      required final String price,
      required final String storeName,
      required final String? storeLogo,
      required final double similarity,
      required final String urlId}) = _$ProductImpl;

  @override
  String get name;
  @override
  String get image;
  @override
  String get price;
  @override
  String get storeName;
  @override
  String? get storeLogo;
  @override
  double get similarity;
  @override
  String get urlId;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
