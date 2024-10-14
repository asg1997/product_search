import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/core/widgets/loading_widget.dart';
import 'package:product_search/core/widgets/main_app_bar.dart';
import 'package:product_search/view/components/product_grid_view.dart';
import 'package:product_search/view/provider/get_product_provider.dart';

class ProductSearchResultPage extends ConsumerWidget {
  const ProductSearchResultPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const MainAppBarWidget(),
      body: ref.watch(getProductsProvider).when(
            data: (products) => Container(
              color: AppColors.mainLightGrey,
              child: ProductGridView(
                products: products,
              ),
            ),
            error: (_, __) => Container(),
            loading: () => const SizedBox(
              height: 200,
              child: LoadingWidget(),
            ),
          ),
    );
  }
}
