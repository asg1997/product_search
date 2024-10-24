import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/core/utils/services/local_storage.dart';
import 'package:product_search/models/store/store.dart';

final localStoresStorageProvider =
    Provider<LocalStoresStorage>(_LocalStoresStorageImpl.new);

/// Хранит кэшированные магазины.
/// Отвечает за автоматическое стирание из памяти
/// кэша
abstract class LocalStoresStorage {
  Future<List<Store>?> getCachedStores();
  Future<void> saveStores(List<Store> stores);
}

class _LocalStoresStorageImpl implements LocalStoresStorage {
  _LocalStoresStorageImpl(this.ref);

  final Ref ref;

  final _storesKey = 'stores';
  final _cacheTimeoutKey = 'cacheTimeoutKey';

  LocalStorage get _localStorage => ref.read(localStorageProvider);

  @override
  Future<List<Store>?> getCachedStores() async {
    if (await _timeoutExpired()) {
      await _clearStores();
      return null;
    } else {
      final jsonStr = await _localStorage.getString(_storesKey);
      if (jsonStr == null) return null;
      final json = jsonDecode(jsonStr) as List<dynamic>;
      final parsed =
          json.map((e) => Store.fromJson(e as Map<String, dynamic>)).toList();

      return parsed;
    }
  }

  @override
  Future<void> saveStores(List<Store> stores) async {
    final encoded = stores.map((e) => e.toJson()).toList();
    final json = jsonEncode(encoded);
    await _localStorage.saveString(_storesKey, json);
    await _setTimeout();
  }

  Future<void> _clearStores() async => _localStorage.removeValue(_storesKey);

  Future<bool> _timeoutExpired() async {
    final timeout = await _cachedTimeout;
    if (timeout == null) return true;
    return DateTime.now().isAfter(timeout);
  }

  Future<DateTime?> get _cachedTimeout async {
    final json = await _localStorage.getString(_cacheTimeoutKey);
    if (json == null) return null;
    final timeout = DateTime.fromMillisecondsSinceEpoch(int.parse(json));
    return timeout;
  }

  Future<void> _setTimeout() async {
    final timeout = DateTime.now().add(const Duration(minutes: 3));
    final json = timeout.millisecondsSinceEpoch.toString();
    await _localStorage.saveString(_cacheTimeoutKey, json);
  }
}
