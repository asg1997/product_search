import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/data/selected_stores_storage.dart';
import 'package:product_search/models/store/store.dart';
import 'package:product_search/view/provider/stores_provider.dart';

final selectedStoresControllerProvider =
    StateNotifierProvider<SelectedStoresController, List<Store>>(
  SelectedStoresController.new,
);

/// Отвечает за обновление юзерских настроек
class SelectedStoresController extends StateNotifier<List<Store>> {
  SelectedStoresController(this.ref) : super([]);

  final Ref ref;

  SelectedStoresStorage get _storage => ref.read(selectedStoresStorageProvider);

  Future<void> init() async {
    final stores = await _storage.selectedStores;
    if (stores != null) {
      state = stores;
    } else {
      final avaliableStores = ref.read(storesProvider);
      await _storage.updateStores(avaliableStores);
      state = avaliableStores;
    }
  }

  Future<void> updateStores(List<Store> stores) async {
    state = stores;
    await _storage.updateStores(state);
  }
}
