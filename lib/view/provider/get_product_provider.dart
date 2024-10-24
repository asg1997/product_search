import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/data/product_searcher.dart';
import 'package:product_search/models/product/product.dart';

final searchProductsProvider = FutureProvider.autoDispose<Products>(
  (ref) async => ref.read(productsSearcherProvider).getProducts(),
);
