// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      name: json['name'] as String,
      image: json['image'] as String,
      price: json['price'] as String,
      storeName: json['storeName'] as String,
      storeLogo: json['storeLogo'] as String,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'storeName': instance.storeName,
      'storeLogo': instance.storeLogo,
    };
