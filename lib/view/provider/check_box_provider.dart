import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier для управления состоянием чекбоксов
class CheckboxStateNotifier extends StateNotifier<List<bool>> {
  CheckboxStateNotifier()
      : super(List.generate(
            10, (_) => false)); // Изначально все чекбоксы не активны

  // Метод для переключения состояния конкретного чекбокса
  void toggleCheckbox(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) !state[i] else state[i],
    ];
  }
}

// Провайдер для управления состоянием чекбоксов
final checkboxProvider =
    StateNotifierProvider<CheckboxStateNotifier, List<bool>>((ref) {
  return CheckboxStateNotifier();
});
