import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/data/stores_fetcher/stores_fetcher.dart';
import 'package:product_search/models/store/store.dart';

final storesControllerProvider =
    StateNotifierProvider<StoresController, List<Store>>(
  StoresController.new,
);

/// Отвечает за получение доступных для поиска магазинов
class StoresController extends StateNotifier<List<Store>> {
  StoresController(this.ref) : super([]);

  final Ref ref;
  bool _initialized = false;
  bool get initialized => _initialized;

  Future<void> init() async {
    final stores = await ref.read(storesFetcherProvider).getStores();
    state = stores;
    _initialized = true;
  }

  Future<void> addStore(Store store) async {}
  Future<void> removeStore(Store store) async {}
}
