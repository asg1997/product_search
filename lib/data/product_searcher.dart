import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:product_search/core/utils/services/graph_ql_config.dart';
import 'package:product_search/data/mappes/product_mapper.dart';
import 'package:product_search/data/product_image_id_fetcher.dart';
import 'package:product_search/models/product/product.dart';
import 'package:product_search/models/search_input/search_input.dart';
import 'package:product_search/models/store/store.dart' as model;

final productsSearcherProvider =
    Provider<ProductsSearcher>(_ProductSearcherImpl.new);

abstract class ProductsSearcher {
  Future<Products> getProducts({
    required SearchInput input,
    required List<model.Store> stores,
  });
}

class _ProductSearcherImpl implements ProductsSearcher {
  _ProductSearcherImpl(this.ref);

  final Ref ref;

  final _query = r'''
               query visualSearch($stores: [StoresInput!], $imageId: String!) {
                visualSearch(stores: $stores, imageId: $imageId) {
                  similarity,
                  item_main_image,
                  store_name,
                  store_geo,
                  item_name,
                  item_last_price,
                  item_last_price_sign,
                  item_url
                }
              }
''';

  @override
  Future<Products> getProducts({
    required SearchInput input,
    required List<model.Store> stores,
  }) async {
    final imageId =
        await ref.read(productImageSenderProvider).getImageId(input);
    try {
      final result = await GraphQlConfig().client.query(
            QueryOptions(
              fetchPolicy: FetchPolicy.cacheAndNetwork,
              document: gql(_query),
              variables: {
                'stores': stores
                    .map(
                      (store) => {
                        'name': store.name,
                        'geo': store.geo,
                      },
                    )
                    .toList(),
                'imageId': imageId,
              },
            ),
          );

      if (result.hasException) {
        throw Exception(result.exception);
      }

      final data = result.data;
      if (data == null || !data.containsKey('visualSearch')) {
        throw Exception('No data found');
      }

      final productsJson = data['visualSearch'] as List<dynamic>;
      final products = ProductMapper().mapProducts(productsJson);
      return products;
    } catch (e) {
      throw Exception(e);
    }
  }
}
