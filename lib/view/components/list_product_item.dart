// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:product_search/core/utils/consts/app_decoration.dart';
import 'package:product_search/models/product/product.dart';
import 'package:product_search/resources/resources.dart';

class ListProductItem extends ConsumerWidget {
  const ListProductItem({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (_, c) {
        final tablet = c.maxWidth < AppDecoration.tabletBreakpoint;
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppDecoration.borderRadius,
          ),
          child: Row(
            children: [
              _Image(productImage: product.image),
              const Gap(12),
              Expanded(
                child: Column(
                  children: [
                    // Row(
                    //   children: [
                    //     PriceWidget(price: product.price),
                    //     Expanded(child: StoreLogo(product: product)),
                    //   ],
                    // ),
                    // _ProductName(product: product),
                  ],
                ),
              ),
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
        final tablet = c.maxWidth < AppDecoration.tabletBreakpoint;
        return Text(
          product.name,
          maxLines: tablet ? 3 : 2,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }
}

class _Image extends ConsumerWidget {
  const _Image({required this.productImage});
  final String productImage;

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
                fit: BoxFit.cover,
                width: tablet ? 120 : 112,
                height: tablet ? 120 : 112,
              ),

              // иконка поиск похожих
              Positioned(
                top: 12,
                right: 12,
                child: GestureDetector(
                  onTap: () {},
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