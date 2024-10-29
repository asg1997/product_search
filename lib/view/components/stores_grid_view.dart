import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/core/utils/consts/app_fonts.dart';
import 'package:product_search/models/store/store.dart';
import 'package:product_search/resources/resources.dart';
import 'package:product_search/view/provider/all_stores_provider.dart';
import 'package:product_search/view/provider/selected_stores_provider.dart';

class StoresGridView extends ConsumerWidget {
  const StoresGridView({
    required this.onSelectionChanged,
    super.key,
  });

  final void Function(List<Store> stores) onSelectionChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avaliableStores = ref.watch(allStoresProvider);
    final selectedStores = ref.watch(selectedStoresProvider);

    final updatedSelectedStores = [...selectedStores];
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 14),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        childAspectRatio: 148 / 26,
        mainAxisSpacing: 14,
      ),
      itemCount: avaliableStores.length,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        final store = avaliableStores[index];
        return _ItemWidget(
          store: store,
          initialValue: selectedStores.contains(store),
          onSelectedChanged: (bool selected) {
            selected
                ? updatedSelectedStores.add(store)
                : updatedSelectedStores.remove(store);
            onSelectionChanged(updatedSelectedStores);
          },
        );
      },
    );
  }
}

class _ItemWidget extends StatefulWidget {
  const _ItemWidget({
    required this.store,
    required this.initialValue,
    required this.onSelectedChanged,
  });

  final Store store;
  final bool initialValue;
  final void Function(bool selected) onSelectedChanged;

  @override
  State<_ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<_ItemWidget> {
  late bool selected = widget.initialValue;
  void onTap() {
    selected = !selected;
    setState(() {});
    widget.onSelectedChanged(selected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            selected ? AppImages.checkFill : AppImages.checkUnfill,
          ),
          const Gap(8),
          Text(
            widget.store.name, // Используем переданную подпись
            style: AppFonts.medium16.copyWith(
              color: selected ? AppColors.mainBlack : AppColors.mainDarkGray,
            ),
          ),
        ],
      ),
    );
  }
}
