import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/data/product_image_sender.dart';
import 'package:product_search/models/product/product.dart';
import 'package:product_search/resources/resources.dart';

final productsSearcherProvider =
    Provider<ProductsSearcher>(_ProductSearcherImpl.new);

abstract class ProductsSearcher {
  Future<Products> getProducts(File file);
}

class _ProductSearcherImpl implements ProductsSearcher {
  _ProductSearcherImpl(this.ref);

  final Ref ref;

  @override
  Future<Products> getProducts(File file) async {
    final imageId =
        await ref.read(productImageSenderProvider).saveImageToServer(file);
    return [
      const Product(
        image: AppImages.image,
        price: '520.23',
        name:
            'Electric Heated Pad Had Warmer Bag Heating for Outdoor Camping Glo...',
        storeName: 'alibaba',
        storeLogo: AppImages.alibaba,
      ),
      const Product(
        image: AppImages.image,
        price: '520.23',
        name:
            'Electric Heated Pad Had Warmer Bag Heating for Outdoor Camping Glo...',
        storeName: 'alibaba',
        storeLogo: AppImages.alibaba,
      ),
      const Product(
        image: AppImages.image,
        price: '520.23',
        name:
            'Electric Heated Pad Had Warmer Bag Heating for Outdoor Camping Glo...',
        storeName: 'alibaba',
        storeLogo: AppImages.alibaba,
      ),
      const Product(
        image: AppImages.image,
        price: '520.23',
        name:
            'Electric Heated Pad Had Warmer Bag Heating for Outdoor Camping Glo...',
        storeName: 'alibaba',
        storeLogo: AppImages.alibaba,
      ),
      const Product(
        image: AppImages.image,
        price: '520.23',
        name:
            'Electric Heated Pad Had Warmer Bag Heating for Outdoor Camping Glo...',
        storeName: 'alibaba',
        storeLogo: AppImages.alibaba,
      ),
      const Product(
        image: AppImages.image,
        price: '520.23',
        name:
            'Electric Heated Pad Had Warmer Bag Heating for Outdoor Camping Glo...',
        storeName: 'alibaba',
        storeLogo: AppImages.alibaba,
      ),
      const Product(
        image: AppImages.image,
        price: '520.23',
        name:
            'Electric Heated Pad Had Warmer Bag Heating for Outdoor Camping Glo...',
        storeName: 'alibaba',
        storeLogo: AppImages.alibaba,
      ),
    ];
  }
}
