import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/data/stores_fetcher/local_stores_storage.dart';
import 'package:product_search/data/stores_fetcher/remote_stores_fetcher.dart';
import 'package:product_search/models/store/store.dart';

final storesFetcherProvider = Provider<StoresFetcher>(_StoresFetcherImpl.new);

/// Получает доступные магазины
abstract class StoresFetcher {
  Future<List<Store>> getStores();
}

class _StoresFetcherImpl implements StoresFetcher {
  _StoresFetcherImpl(this.ref);
  LocalStoresStorage get _local => ref.read(localStoresStorageProvider);
  RemoteStoresFetcher get _remote => ref.read(remoteStoresFetcherProvider);
  final Ref ref;
  @override
  Future<List<Store>> getStores() async {
    final cached = await _local.getCachedStores();
    if (cached != null) return cached;
    final remoteStores = await _remote.getStores();
    await _local.saveStores(remoteStores);
    return remoteStores;
  }
}
