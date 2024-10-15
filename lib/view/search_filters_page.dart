import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/core/utils/consts/app_decoration.dart';
import 'package:product_search/core/widgets/main_app_bar.dart';
import 'package:product_search/core/widgets/main_button.dart';
import 'package:product_search/resources/resources.dart';
import 'package:product_search/view/components/select_stores_widget.dart';

class SearchFiltersPage extends ConsumerWidget {
  const SearchFiltersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const MainAppBarWidget(),
      body: Padding(
        padding: AppDecoration.padding12.copyWith(top: 20, bottom: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // кнопка закрыть
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset(AppImages.close),
              ),
            ),

            // дивайдер
            const Divider(
              thickness: 2,
              height: 30,
              color: AppColors.mainLightGrey,
            ),

            // фильтрация
            const FilterStoresWidget(),

            const Spacer(),

            // кнопка
            MainButton(title: 'Apply filters', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
