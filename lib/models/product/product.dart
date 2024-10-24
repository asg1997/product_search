import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

typedef ProductId = String;
typedef Products = List<Product>;

/// Найденый товар
@freezed
class Product with _$Product {
  const factory Product({
    required String name,
    required String image,
    required String price,
    required String storeName,
    required String storeLogo,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
