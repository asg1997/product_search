import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/core/utils/services/local_storage.dart';
import 'package:product_search/models/store/store.dart';

final selectedStoresStorageProvider =
    Provider<SelectedStoresStorage>(_SelectedStoresStorageImpl.new);

abstract class SelectedStoresStorage {
  Future<List<Store>?> get selectedStores;

  /// Полностью перезаписывает данные о выбранных магазинах
  Future<void> updateStores(List<Store> stores);
}

class _SelectedStoresStorageImpl implements SelectedStoresStorage {
  _SelectedStoresStorageImpl(this.ref);

  final Ref ref;
  LocalStorage get _localStorage => ref.read(localStorageProvider);
  final _key = 'selectedStores';

  @override
  Future<void> updateStores(List<Store> stores) async {
    final encoded = stores.map((e) => e.toJson()).toList();
    final json = jsonEncode(encoded);
    await _localStorage.saveString(_key, json);
  }

  @override
  Future<List<Store>?> get selectedStores async {
    final jsonStr = await _localStorage.getString(_key);
    if (jsonStr == null) return null;
    final json = jsonDecode(jsonStr) as List<dynamic>;
    final parsed =
        json.map((e) => Store.fromJson(e as Map<String, dynamic>)).toList();

    return parsed;
  }
}
