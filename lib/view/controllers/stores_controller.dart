import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/data/stores_fetcher/stores_fetcher.dart';
import 'package:product_search/models/store/store.dart';

final storesControllerProvider =
    StateNotifierProvider<StoresController, List<Store>>(
  StoresController.new,
);

class StoresController extends StateNotifier<List<Store>> {
  StoresController(this.ref) : super([]);

  final Ref ref;

  Future<void> init() async {
    final stores = await ref.read(storesFetcherProvider).getStores();
    state = stores;
  }
}
