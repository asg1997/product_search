import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/core/utils/consts/app_fonts.dart';
import 'package:product_search/core/utils/extensions.dart';

class PriceWidget extends ConsumerWidget {
  const PriceWidget({required this.price, super.key});

  final String price;
  static const tabletHeigth = 36.0;
  static const phoneHeigth = 24.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: context.isTablet ? 12 : 8),
      height: context.isTablet ? tabletHeigth : phoneHeigth,
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
