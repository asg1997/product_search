import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/view/models/select_stores/select_stores.dart';

final selectStoresFetcherProvider =
    Provider<SelectStoresFetcher>(_SelectStoresFetcherImpl.new);

abstract class SelectStoresFetcher {
  Future<SelectStories> getSelectStories();
}

class _SelectStoresFetcherImpl implements SelectStoresFetcher {
  _SelectStoresFetcherImpl(this.ref);

  final Ref ref;

  @override
  Future<SelectStories> getSelectStories() async {
    return [
      const SelectStores(title: 'aliexpress'),
      const SelectStores(title: 'ebay'),
      const SelectStores(title: 'amazon'),
      const SelectStores(title: 'alibaba'),
      const SelectStores(title: 'aliexpress'),
      const SelectStores(title: 'ebay'),
      const SelectStores(title: 'amazon'),
      const SelectStores(title: 'alibaba'),
      const SelectStores(title: 'aliexpress'),
      const SelectStores(title: 'ebay'),
      const SelectStores(title: 'amazon'),
      const SelectStores(title: 'alibaba'),
    ];
  }
}
