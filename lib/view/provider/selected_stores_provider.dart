import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/models/store/store.dart';
import 'package:product_search/view/controllers/selected_stores_controller.dart';

final selectedStoresProvider = StateProvider<List<Store>>(
  (ref) => ref.watch(selectedStoresControllerProvider),
);
