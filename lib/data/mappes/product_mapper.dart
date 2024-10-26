import 'package:product_search/data/models/api_product/api_product.dart';
import 'package:product_search/models/product/product.dart';
import 'package:product_search/resources/resources.dart';

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
      storeLogo: _getImage(apiProduct.storeName),
      similarity: apiProduct.similarity,
    );
  }

  ApiProduct _mapApiProduct(Map<String, dynamic> json) =>
      ApiProduct.fromJson(json);

  String? _getImage(String storeName) {
    final transformed = storeName.toLowerCase().replaceAll('_', '');
    return switch (transformed) {
      'alibaba' => AppImages.alibaba,
      'amazon' => AppImages.amazon,
      'aliexpress' => AppImages.aliExpress,
      'costco' => AppImages.costco,
      'coupang' => AppImages.coupang,
      'dhgate' => AppImages.dhgate,
      'ebay' => AppImages.ebay,
      'etsy' => AppImages.etsy,
      'jd' => AppImages.jd,
      'lazada' => AppImages.lazada,
      '1688' => AppImages.logo1688,
      'mercari' => AppImages.mercari,
      'pinduoduo' => AppImages.pinduoduo,
      'rakuten' => AppImages.rakuten,
      'shopee' => AppImages.shopee,
      'taobao' => AppImages.taobao,
      'target' => AppImages.target,
      'temu' => AppImages.temu,
      'walmart' => AppImages.walmart,
      'wayfair' => AppImages.wayfair,
      _ => null,
    };
  }
}
