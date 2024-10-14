// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      image: json['image'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
      nameStore: json['nameStore'] as String,
      imageStore: json['imageStore'] as String,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
      'price': instance.price,
      'description': instance.description,
      'nameStore': instance.nameStore,
      'imageStore': instance.imageStore,
    };
