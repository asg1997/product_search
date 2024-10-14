import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/view/components/check_box_widget.dart';
import 'package:product_search/view/provider/check_box_provider.dart'; // Импортируем CheckboxWidget

class SelectStoresGridView extends ConsumerWidget {
  const SelectStoresGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkboxStates =
        ref.watch(checkboxProvider); // Наблюдаем за состоянием чекбоксов

    final storeNames = [
      'aliexpress',
      'amazon',
      'ebay',
      'walmart',
      'bestbuy',
      'target',
      'ikea',
      'costco',
      'etsy',
      'shopify'
    ]; // Имена магазинов

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 14),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        childAspectRatio: 148 / 26,
        mainAxisSpacing: 14,
      ),
      itemCount: checkboxStates.length,
      shrinkWrap: true,
      itemBuilder: (_, int index) {
        final isChecked = checkboxStates[index]; // Получаем состояние чекбокса
        return CheckboxWidget(
          isChecked: isChecked,
          label: storeNames[index], // Подпись для каждого чекбокса
          onChanged: (newValue) {
            ref
                .read(checkboxProvider.notifier)
                .toggleCheckbox(index); // Переключаем состояние чекбокса
          },
        );
      },
    );
  }
}
