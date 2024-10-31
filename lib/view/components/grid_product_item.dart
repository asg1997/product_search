import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/core/utils/consts/app_decoration.dart';
import 'package:product_search/core/utils/consts/app_fonts.dart';
import 'package:product_search/core/utils/extensions.dart';
import 'package:product_search/models/product/product.dart';
import 'package:product_search/resources/resources.dart';
import 'package:product_search/view/components/price_widget.dart';
import 'package:product_search/view/components/store_logo.dart';
import 'package:product_search/view/product_page.dart';

class GridProductItem extends ConsumerWidget {
  const GridProductItem({
    required this.onImageTapped,
    required this.product,
    super.key,
  });

  final Product product;
  final VoidCallback onImageTapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(bottom: context.isTablet ? 24 : 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppDecoration.borderRadius,
      ),
      child: Column(
        children: [
          _Image(product: product, onTap: onImageTapped),
          const Gap(12),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => ProductPage.navigate(context, product: product),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.isTablet ? 24 : 12,
                ),
                child: Column(
                  children: [
                    Expanded(child: _ProductName(product: product)),
                    const Gap(4),
                    StoreLogo(product: product),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductName extends StatelessWidget {
  const _ProductName({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Text(
      product.name,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: context.isTablet
          ? AppFonts.medium14.copyWith(
              color: AppColors.mainDarkGray,
              height: 1.5,
            )
          : AppFonts.medium12.copyWith(
              color: AppColors.mainDarkGray,
              height: 1.5,
            ),
    );
  }
}

class _Image extends ConsumerWidget {
  const _Image({required this.product, required this.onTap});
  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = context.isTablet
        ? 120 + PriceWidget.tabletHeigth / 2
        : 112 + PriceWidget.phoneHeigth / 2;
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Stack(
              children: [
                Image.network(
                  product.image,
                  errorBuilder: (context, error, stackTrace) => Container(),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: context.isTablet ? 120 : 112,
                ),

                // иконка поиск похожих
                Positioned(
                  top: 12,
                  right: 12,
                  child: GestureDetector(
                    onTap: onTap,
                    child: Image.asset(AppImages.search),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: context.isTablet ? 24 : 12,
            child: PriceWidget(price: product.price),
          ),
        ],
      ),
    );
  }
}
