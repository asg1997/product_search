import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/view/controllers/stores_controller.dart';

final allStoresProvider = StateProvider((ref) {
  assert(
    ref.read(storesControllerProvider.notifier).initialized,
    'Необходимо первоначально инициализировать StoresController',
  );
  return ref.watch(storesControllerProvider);
});
