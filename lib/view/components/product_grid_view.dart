import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:product_search/core/utils/consts/app_decoration.dart';
import 'package:product_search/core/widgets/price_widget.dart';
import 'package:product_search/models/product/product.dart';
import 'package:product_search/resources/resources.dart';

class ProductGridView extends ConsumerWidget {
  const ProductGridView({
    super.key,
    required this.products,
  });

  final Products products;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      padding: AppDecoration.padding12.copyWith(top: 12, bottom: 30),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        childAspectRatio: 172 / 250,
        mainAxisSpacing: 8,
      ),
      itemCount: products.length,
      itemBuilder: (_, int index) => _ProductItem(
        product: products[index],
      ),
    );
  }
}

class _ProductItem extends ConsumerWidget {
  const _ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppDecoration.borderRadius,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              // картинка товара
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: Stack(
                  children: [
                    Image.asset(
                      product.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 128,
                    ),

                    // иконка поиск похожих
                    Positioned(
                        top: 12,
                        right: 12,
                        child: GestureDetector(
                            onTap: () {}, child: Image.asset(AppImages.search)))
                  ],
                ),
              ),
              Padding(
                padding: AppDecoration.padding12.copyWith(top: 20),
                child: Column(
                  children: [
                    // название товара
                    Text(
                      product.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(4),

                    // картинка магазина с названием
                    Row(
                      children: [
                        // картинка магазина
                        Image.asset(product.imageStore),
                        const Gap(6),

                        // название магазина
                        Text(product.nameStore)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),

          // цена
          Align(
            alignment: const Alignment(-0.85, -0.03),
            child: PriceWidget(
              price: product.price,
            ),
          )
        ],
      ),
    );
  }
}
