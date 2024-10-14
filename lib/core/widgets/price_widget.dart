import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/core/utils/consts/app_fonts.dart';

class PriceWidget extends ConsumerWidget {
  const PriceWidget({super.key, required this.price});

  final String price;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
      decoration: BoxDecoration(
        color: AppColors.mainYellow1,
        borderRadius: BorderRadius.circular(24),
      ),

      // цена
      child: Text(
        price,
        style: AppFonts.extraBold16,
      ),
    );
  }
}
