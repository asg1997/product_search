import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/core/utils/consts/app_fonts.dart';
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
      mainAxisSize: MainAxisSize.min,
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
        Expanded(
          child: Text(
            product.storeName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppFonts.medium12.copyWith(color: AppColors.mainDarkGray),
          ),
        ),
      ],
    );
  }
}
