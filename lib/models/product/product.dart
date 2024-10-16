import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

typedef ProductId = String;
typedef Products = List<Product>;

@freezed
class Product with _$Product {
  const factory Product({
    required String image,
    required String price,
    required String description,
    required String nameStore,
    required String imageStore,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
