import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/data/product_searcher.dart';
import 'package:product_search/models/product/product.dart';

final searchProductsProvider =
    FutureProvider.family.autoDispose<Products, File>(
  (ref, file) async => ref.read(productsSearcherProvider).getProducts(file),
);
