import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/core/utils/consts/app_fonts.dart';
import 'package:product_search/view/components/select_stores_grid_view.dart';

class SelectStoresWidget extends ConsumerWidget {
  const SelectStoresWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // название
          Text('Select stores', style: AppFonts.linksButtonSmall),

          // чекбокс
          const SelectStoresGridView()
        ],
      ),
    );
  }
}
