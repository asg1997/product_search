import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:product_search/models/product/product.dart';

class StoreLogo extends StatelessWidget {
  const StoreLogo({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
        Expanded(child: Text(product.storeName)),
      ],
    );
  }
}
