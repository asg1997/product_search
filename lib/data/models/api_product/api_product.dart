import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_product.freezed.dart';
part 'api_product.g.dart';

@freezed
// @JsonSerializable(fieldRename: FieldRename.snake)
class ApiProduct with _$ApiProduct {
  const factory ApiProduct({
    @JsonKey(name: 'item_main_image') required String itemMainImage,
    required double similarity,
    @JsonKey(name: 'store_name') required String storeName,
    @JsonKey(name: 'store_geo') required String storeGeo,
    @JsonKey(name: 'item_name') required String itemName,
    @JsonKey(name: 'item_last_price') required double itemLastPrice,
    @JsonKey(name: 'item_last_price_sign') required String itemLastPriceSign,
    @JsonKey(name: 'item_url') required String itemUrl,
  }) = _ApiProduct;
  const ApiProduct._();

  factory ApiProduct.fromJson(Map<String, dynamic> json) =>
      _$ApiProductFromJson(json);
}
