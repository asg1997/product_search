import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:product_search/core/utils/consts/app_decoration.dart';
import 'package:product_search/core/widgets/price_widget.dart';
import 'package:product_search/models/product/product.dart';
import 'package:product_search/resources/resources.dart';

class GridProductItem extends ConsumerWidget {
  const GridProductItem({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (_, p) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppDecoration.borderRadius,
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  // КАРТИНКА ТОВАРА
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Stack(
                      children: [
                        Image.network(
                          product.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: p.maxWidth > 500 ? 168 : 128,
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
                  ),
                  Padding(
                    padding: AppDecoration.padding12.copyWith(top: 20),
                    child: Column(
                      children: [
                        // название товара
                        Text(
                          product.name,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Gap(4),

                        Row(
                          children: [
                            // ЛОГО МАГАЗИНА
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                product.storeLogo,
                                width: 24,
                                height: 24,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const Gap(6),

                            // название магазина
                            Expanded(child: Text(product.storeName)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // цена
              Align(
                alignment: const Alignment(-0.85, 0),
                child: PriceWidget(
                  price: product.price,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
