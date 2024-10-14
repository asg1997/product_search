import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/view/data/product_fetcher.dart';
import 'package:product_search/view/models/product/product.dart';

final getProductsProvider = FutureProvider.autoDispose<Products>(
  (ref) async => ref.read(productFetcherProvider).getProducts(),
);
