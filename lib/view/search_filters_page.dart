import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/core/utils/consts/app_decoration.dart';
import 'package:product_search/core/utils/consts/app_fonts.dart';
import 'package:product_search/core/widgets/main_app_bar.dart';
import 'package:product_search/core/widgets/main_button.dart';
import 'package:product_search/resources/resources.dart';
import 'package:product_search/view/components/stores_grid_view.dart';
import 'package:product_search/view/controllers/selected_stores_controller.dart';
import 'package:product_search/view/provider/selected_stores_provider.dart';

class SearchFiltersPage extends ConsumerWidget {
  const SearchFiltersPage({super.key});

  static void navigate(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => const SearchFiltersPage(),
        ),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedStores = ref.watch(selectedStoresProvider);
    return Scaffold(
      appBar: const MainAppBarWidget(),
      body: Padding(
        padding: AppDecoration.padding12.copyWith(top: 20, bottom: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ЗАКРЫТЬ
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset(AppImages.close),
              ),
            ),

            const Divider(
              thickness: 2,
              height: 30,
              color: AppColors.mainLightGrey,
            ),

            // МАГАЗИНЫ
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select stores', style: AppFonts.linksButtonSmall),
                  StoresGridView(
                    onSelectionChanged: (stores) {
                      selectedStores = stores;
                    },
                  ),
                ],
              ),
            ),

            const Spacer(),

            // ПРИМЕНИТЬ
            MainButton(
              title: 'Apply filters',
              onTap: () async {
                await ref
                    .read(selectedStoresControllerProvider.notifier)
                    .updateStores(selectedStores);
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
