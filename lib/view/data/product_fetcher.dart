import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/resources/resources.dart';
import 'package:product_search/view/models/product/product.dart';

final productFetcherProvider =
    Provider<ProductFetcher>(_ProductFetcherImpl.new);

abstract class ProductFetcher {
  Future<Products> getProducts();
}

class _ProductFetcherImpl implements ProductFetcher {
  _ProductFetcherImpl(this.ref);

  final Ref ref;

  @override
  Future<Products> getProducts() async {
    return [
      const Product(
          image: AppImages.image,
          price: '520.23',
          description:
              'Electric Heated Pad Had Warmer Bag Heating for Outdoor Camping Glo...',
          nameStore: 'alibaba',
          imageStore: AppImages.alibaba),
      const Product(
          image: AppImages.image,
          price: '520.23',
          description:
              'Electric Heated Pad Had Warmer Bag Heating for Outdoor Camping Glo...',
          nameStore: 'alibaba',
          imageStore: AppImages.alibaba),
      const Product(
          image: AppImages.image,
          price: '520.23',
          description:
              'Electric Heated Pad Had Warmer Bag Heating for Outdoor Camping Glo...',
          nameStore: 'alibaba',
          imageStore: AppImages.alibaba),
      const Product(
          image: AppImages.image,
          price: '520.23',
          description:
              'Electric Heated Pad Had Warmer Bag Heating for Outdoor Camping Glo...',
          nameStore: 'alibaba',
          imageStore: AppImages.alibaba),
      const Product(
          image: AppImages.image,
          price: '520.23',
          description:
              'Electric Heated Pad Had Warmer Bag Heating for Outdoor Camping Glo...',
          nameStore: 'alibaba',
          imageStore: AppImages.alibaba),
      const Product(
          image: AppImages.image,
          price: '520.23',
          description:
              'Electric Heated Pad Had Warmer Bag Heating for Outdoor Camping Glo...',
          nameStore: 'alibaba',
          imageStore: AppImages.alibaba),
      const Product(
          image: AppImages.image,
          price: '520.23',
          description:
              'Electric Heated Pad Had Warmer Bag Heating for Outdoor Camping Glo...',
          nameStore: 'alibaba',
          imageStore: AppImages.alibaba)
    ];
  }
}
