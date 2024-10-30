import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/data/product_searcher.dart';
import 'package:product_search/models/product/product.dart';
import 'package:product_search/models/search_input/search_input.dart';
import 'package:product_search/view/provider/selected_stores_provider.dart';

final searchProductsProvider =
    FutureProvider.family.autoDispose<Products, SearchInput>(
  (ref, file) async {
    final stores = ref.watch(selectedStoresProvider);
    final products = await ref.read(productsSearcherProvider).getProducts(
          input: file,
          stores: stores,
        );

    final sorted =
        products.sorted((a, b) => a.similarity.compareTo(b.similarity));
    return sorted;
  },
);


// final searchProductsProvider =
//     FutureProvider.family.autoDispose<Products, SearchInput>(
//   (ref, file) async {
//     return [
//       const Product(
//         name: 'name',
//         image: 'image',
//         price: 'price',
//         storeName: 'storeName',
//         storeLogo: 'storeLogo',
//         similarity: 1.1,
//       ),
//       const Product(
//         name: 'name',
//         image: 'image',
//         price: 'price',
//         storeName: 'storeName',
//         storeLogo: 'storeLogo',
//         similarity: 1.1,
//       ),
//       const Product(
//         name: 'name',
//         image: 'image',
//         price: 'price',
//         storeName: 'storeName',
//         storeLogo: 'storeLogo',
//         similarity: 1.1,
//       ),
//       const Product(
//         name: 'name',
//         image: 'image',
//         price: 'price',
//         storeName: 'storeName',
//         storeLogo: 'storeLogo',
//         similarity: 1.1,
//       ),
//       const Product(
//         name: 'name',
//         image: 'image',
//         price: 'price',
//         storeName: 'storeName',
//         storeLogo: 'storeLogo',
//         similarity: 1.1,
//       ),
//       const Product(
//         name: 'name',
//         image: 'image',
//         price: 'price',
//         storeName: 'storeName',
//         storeLogo: 'storeLogo',
//         similarity: 1.1,
//       ),
//       const Product(
//         name: 'name',
//         image: 'image',
//         price: 'price',
//         storeName: 'storeName',
//         storeLogo: 'storeLogo',
//         similarity: 1.1,
//       ),
//       const Product(
//         name: 'name',
//         image: 'image',
//         price: 'price',
//         storeName: 'storeName',
//         storeLogo: 'storeLogo',
//         similarity: 1.1,
//       ),
//       const Product(
//         name: 'name',
//         image: 'image',
//         price: 'price',
//         storeName: 'storeName',
//         storeLogo: 'storeLogo',
//         similarity: 1.1,
//       ),
//       const Product(
//         name: 'name',
//         image: 'image',
//         price: 'price',
//         storeName: 'storeName',
//         storeLogo: 'storeLogo',
//         similarity: 1.1,
//       ),
//       const Product(
//         name: 'name',
//         image: 'image',
//         price: 'price',
//         storeName: 'storeName',
//         storeLogo: 'storeLogo',
//         similarity: 1.1,
//       ),
//       const Product(
//         name: 'name',
//         image: 'image',
//         price: 'price',
//         storeName: 'storeName',
//         storeLogo: 'storeLogo',
//         similarity: 1.1,
//       ),
//       const Product(
//         name: 'name',
//         image: 'image',
//         price: 'price',
//         storeName: 'storeName',
//         storeLogo: 'storeLogo',
//         similarity: 1.1,
//       ),
//       const Product(
//         name: 'name',
//         image: 'image',
//         price: 'price',
//         storeName: 'storeName',
//         storeLogo: 'storeLogo',
//         similarity: 1.1,
//       ),
//       const Product(
//         name: 'name',
//         image: 'image',
//         price: 'price',
//         storeName: 'storeName',
//         storeLogo: 'storeLogo',
//         similarity: 1.1,
//       ),
//     ];
//   },
// );

