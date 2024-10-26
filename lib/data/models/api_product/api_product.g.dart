// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiProductImpl _$$ApiProductImplFromJson(Map<String, dynamic> json) =>
    _$ApiProductImpl(
      itemMainImage: json['item_main_image'] as String,
      similarity: (json['similarity'] as num).toDouble(),
      storeName: json['store_name'] as String,
      storeGeo: json['store_geo'] as String,
      itemName: json['item_name'] as String,
      itemLastPrice: (json['item_last_price'] as num).toDouble(),
      itemLastPriceSign: json['item_last_price_sign'] as String,
      itemUrl: json['item_url'] as String,
    );

Map<String, dynamic> _$$ApiProductImplToJson(_$ApiProductImpl instance) =>
    <String, dynamic>{
      'item_main_image': instance.itemMainImage,
      'similarity': instance.similarity,
      'store_name': instance.storeName,
      'store_geo': instance.storeGeo,
      'item_name': instance.itemName,
      'item_last_price': instance.itemLastPrice,
      'item_last_price_sign': instance.itemLastPriceSign,
      'item_url': instance.itemUrl,
    };
