import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/core/utils/consts/app_fonts.dart';
import 'package:product_search/core/widgets/loading_widget.dart';
import 'package:product_search/view/components/select_stores_grid_view.dart';
import 'package:product_search/view/provider/get_filter_stories_provider.dart';

class FilterStoresWidget extends ConsumerWidget {
  const FilterStoresWidget({super.key});

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
          ref.watch(getFilterStoriesProvider).when(
                data: (filters) => FiltersStoresGridView(
                  filterStories: filters,
                ),
                error: (_, __) => Container(),
                loading: () => const SizedBox(
                  height: 200,
                  child: LoadingWidget(),
                ),
              ),
        ],
      ),
    );
  }
}
