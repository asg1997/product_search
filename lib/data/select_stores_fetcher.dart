import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/models/filter_stores/filter_stores.dart';

final filterStoresFetcherProvider =
    Provider<SelectStoresFetcher>(_SelectStoresFetcherImpl.new);

abstract class SelectStoresFetcher {
  Future<FilterStories> getFilterStories();
}

class _SelectStoresFetcherImpl implements SelectStoresFetcher {
  _SelectStoresFetcherImpl(this.ref);

  final Ref ref;

  @override
  Future<FilterStories> getFilterStories() async {
    return [
      const FilterStores(title: 'aliexpress', id: '1', isSelected: true),
      const FilterStores(title: 'ebay', id: '2', isSelected: false),
      const FilterStores(title: 'amazon', id: '3', isSelected: true),
      const FilterStores(title: 'alibaba', id: '4', isSelected: false),
      const FilterStores(title: 'aliexpress', id: '5', isSelected: true),
      const FilterStores(title: 'ebay', id: '6', isSelected: false),
      const FilterStores(title: 'amazon', id: '7', isSelected: false),
      const FilterStores(title: 'alibaba', id: '8', isSelected: true),
      const FilterStores(title: 'aliexpress', id: '9', isSelected: true),
      const FilterStores(title: 'ebay', id: '10', isSelected: false),
      const FilterStores(title: 'amazon', id: '11', isSelected: true),
      const FilterStores(title: 'alibaba', id: '12', isSelected: true),
    ];
  }
}
