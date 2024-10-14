import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/data/product_fetcher.dart';
import 'package:product_search/models/product/product.dart';

final getProductsProvider = FutureProvider.autoDispose<Products>(
  (ref) async => ref.read(productFetcherProvider).getProducts(),
);
