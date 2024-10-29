import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/data/product_searcher.dart';
import 'package:product_search/models/product/product.dart';
import 'package:product_search/models/search_input/search_input.dart';
import 'package:product_search/view/provider/stores_provider.dart';

final searchProductsProvider =
    FutureProvider.family.autoDispose<Products, SearchInput>(
  (ref, file) async {
    final stores = ref.watch(storesProvider);
    return ref.read(productsSearcherProvider).getProducts(
          input: file,
          stores: stores,
        );
  },
);