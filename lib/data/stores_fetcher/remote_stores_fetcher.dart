import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:product_search/core/utils/consts/graph_ql_config.dart';
import 'package:product_search/models/store/store.dart' as model;

final remoteStoresFetcherProvider =
    Provider<RemoteStoresFetcher>(_RemoteStoresFetcherImpl.new);

/// Получает доступные магазины
abstract class RemoteStoresFetcher {
  Future<List<model.Store>> getStores();
}

class _RemoteStoresFetcherImpl implements RemoteStoresFetcher {
  _RemoteStoresFetcherImpl(this.ref);

  final Ref ref;

  @override
  Future<List<model.Store>> getStores() async {
    try {
      final result = await GraphQlConfig().client.query(
            QueryOptions(
              fetchPolicy: FetchPolicy.noCache,
              document: gql('''
                query getAppConfig {
                  getAppConfig {
                    stores {
                      store_name
                      store_geo
                    }
                  }
                }
'''),
            ),
          );
      if (result.hasException) {
        throw Exception(result.exception);
      }

      final data = result.data;
      if (data == null || data.isEmpty) return [];
      final stores = _parseStores(data);
      return stores;
    } catch (e) {
      throw Exception(e);
    }
  }

  List<model.Store> _parseStores(Map<String, dynamic> json) {
    final appConfig = json['getAppConfig'] as Map<String, dynamic>;
    final stores = appConfig['stores'] as List<dynamic>;
    final decodedStores = stores.map((e) {
      e as Map<String, dynamic>;
      return model.Store(
        name: e['store_name'] as String,
        geo: e['store_geo'] as String,
      );
    }).toList();
    return decodedStores;
  }
}
