import 'package:product_search/data/models/api_product/api_product.dart';
import 'package:product_search/models/product/product.dart';

class ProductMapper {
  List<Product> mapProducts(List<dynamic> json) {
    return json.map((e) => _mapProduct(e as Map<String, dynamic>)).toList();
  }

  Product _mapProduct(Map<String, dynamic> json) {
    final apiProduct = _mapApiProduct(json);
    return Product(
      name: apiProduct.itemName,
      image: apiProduct.itemMainImage,
      price: '${apiProduct.itemLastPrice}${apiProduct.itemLastPriceSign}',
      storeName: apiProduct.storeName,
      storeLogo:
          'https://avatars.mds.yandex.net/i?id=08b7af9446b2f3d45afef589151c5204df2fc3c1-10385932-images-thumbs&n=13',
      similarity: apiProduct.similarity,
    );
  }

  ApiProduct _mapApiProduct(Map<String, dynamic> json) =>
      ApiProduct.fromJson(json);
}
