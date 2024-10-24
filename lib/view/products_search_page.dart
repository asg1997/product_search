import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/core/widgets/logo_widget.dart';
import 'package:product_search/models/product/product.dart';
import 'package:product_search/view/components/list_product_item.dart';

class ProductsSearchPage extends ConsumerWidget {
  const ProductsSearchPage({required this.image, super.key});
  final File image;

  static void navigate(BuildContext context, {required File image}) =>
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (_) => ProductsSearchPage(image: image),
        ),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.mainLightGrey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const BackButton(color: Colors.white),
            centerTitle: true,
            pinned: true,
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            title: const LogoWidget(),
            expandedHeight: MediaQuery.of(context).size.height * .6,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  child: Image.file(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: SliverList.separated(
              separatorBuilder: (_, __) => const Gap(8),
              itemBuilder: (_, index) {
                return const ListProductItem(
                  product: Product(
                    image:
                        'https://jureursicphotography.com/wp-content/uploads/2020/10/2020_02_21_Sephora-Favurite-Box5247.jpg',
                    price: r'34$',
                    name:
                        'Laborum nisi aute cupidatat consectetur ea cupidatat amet sunt reprehenderit sunt et.',
                    storeName: 'Alibaba',
                    storeLogo:
                        'https://www.brandcolorcode.com/images/color-palette/head-shoulders.png',
                  ),
                );
              },
            ),
            // sliver: SliverGrid.builder(
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 1,
            //     crossAxisSpacing: 8,
            //     mainAxisSpacing: 8,
            //   ),
            //   itemBuilder: (_, index) {
            //     return const ListProductItem(
            //       product: Product(
            //         image:
            //             'https://jureursicphotography.com/wp-content/uploads/2020/10/2020_02_21_Sephora-Favurite-Box5247.jpg',
            //         price: r'34$',
            //         description:
            //             'Laborum nisi aute cupidatat consectetur ea cupidatat amet sunt reprehenderit sunt et.',
            //         nameStore: 'Alibaba',
            //         imageStore:
            //             'https://www.brandcolorcode.com/images/color-palette/head-shoulders.png',
            //       ),
            //     );
            //   },
            // ),
          ),
          // ref.watch(searchProductsProvider).when(
          //       data: (products) => ColoredBox(
          //         color: AppColors.mainLightGrey,
          //         child: ProductGridView(
          //           products: products,
          //         ),
          //       ),
          //       error: (_, __) => Container(),
          //       loading: () => const SizedBox(
          //         height: 200,
          //         child: LoadingWidget(),
          //       ),
          //     ),
        ],
      ),
    );
  }
}
