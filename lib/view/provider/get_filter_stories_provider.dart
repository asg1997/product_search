import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/data/select_stores_fetcher.dart';
import 'package:product_search/models/filter_stores/filter_stores.dart';

final getFilterStoriesProvider = FutureProvider.autoDispose<FilterStories>(
  (ref) async => ref.read(filterStoresFetcherProvider).getFilterStories(),
);
