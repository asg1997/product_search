import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/view/controllers/stores_controller.dart';

typedef IsReady = bool;
final launchControllerProvider =
    StateNotifierProvider.autoDispose<LaunchController, IsReady>(
  LaunchController.new,
);

class LaunchController extends StateNotifier<IsReady> {
  LaunchController(this.ref) : super(false) {
    init();
  }

  final Ref ref;

  Future<void> init() async {
    try {
      await ref.read(storesControllerProvider.notifier).init();
    } finally {
      state = true;
    }
  }
}
