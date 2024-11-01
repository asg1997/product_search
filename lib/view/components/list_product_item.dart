import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/core/utils/consts/app_decoration.dart';
import 'package:product_search/core/utils/consts/app_fonts.dart';
import 'package:product_search/models/product/product.dart';
import 'package:product_search/resources/resources.dart';
import 'package:product_search/view/components/price_widget.dart';
import 'package:product_search/view/components/store_logo.dart';
import 'package:product_search/view/product_page.dart';

class ListProductItem extends ConsumerWidget {
  const ListProductItem({
    required this.product,
    required this.onImageTapped,
    super.key,
  });

  final Product product;
  final VoidCallback onImageTapped;

  void onProductTapped(BuildContext context) {
    ProductPage.navigate(context, product: product);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (_, c) {
        final tablet = c.maxWidth >= AppDecoration.tabletBreakpoint;
        return Container(
          padding: EdgeInsets.only(right: tablet ? 47 : 22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppDecoration.borderRadius,
          ),
          child: Row(
            children: [
              // КАРТИНКА
              _Image(productImage: product.image, onTap: onImageTapped),
              const Gap(12),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onProductTapped(context),
                  child: Column(
                    children: [
                      if (!tablet) ...[
                        Row(
                          children: [
                            PriceWidget(price: product.price),
                            const Gap(8),
                            Expanded(child: StoreLogo(product: product)),
                          ],
                        ),
                        const Gap(16),
                      ],
                      _ProductName(product: product),
                    ],
                  ),
                ),
              ),
              if (tablet) ...[
                const Gap(24),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onProductTapped(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PriceWidget(price: product.price),
                      const Gap(10),
                      StoreLogo(product: product),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
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
    return LayoutBuilder(
      builder: (_, c) {
        final tablet = c.maxWidth >= AppDecoration.tabletBreakpoint;
        return Text(
          product.name,
          maxLines: tablet ? 3 : 2,
          overflow: TextOverflow.ellipsis,
          style: AppFonts.medium14.copyWith(color: AppColors.mainDarkGray),
        );
      },
    );
  }
}

class _Image extends ConsumerWidget {
  const _Image({required this.productImage, required this.onTap});
  final String productImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (_, c) {
        final tablet = c.maxWidth < AppDecoration.tabletBreakpoint;
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          child: Stack(
            children: [
              Image.network(
                productImage,
                errorBuilder: (context, error, stackTrace) => Container(),
                fit: BoxFit.cover,
                width: tablet ? 120 : 112,
                height: tablet ? 120 : 112,
              ),

              // иконка поиск похожих
              Positioned(
                top: 12,
                left: 12,
                child: GestureDetector(
                  onTap: onTap,
                  child: Image.asset(AppImages.search),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
