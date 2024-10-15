import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/models/filter_stores/filter_stores.dart';
import 'package:product_search/view/components/filter_stores_widget.dart';

class FiltersStoresGridView extends ConsumerWidget {
  const FiltersStoresGridView({
    required this.filterStories,
    super.key,
  });

  final FilterStories filterStories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 14),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        childAspectRatio: 148 / 26,
        mainAxisSpacing: 14,
      ),
      itemCount: filterStories.length,
      shrinkWrap: true,
      itemBuilder: (_, int index) => _FilterWidget(
        filterStores: filterStories[index],
      ),
    );
  }
}

class _FilterWidget extends ConsumerWidget {
  const _FilterWidget({required this.filterStores, super.key});

  final FilterStores filterStores;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilterWidget(
      isChecked: filterStores.isSelected,
      title: filterStores.title,
      onChanged: (_) {},
    );
  }
}
