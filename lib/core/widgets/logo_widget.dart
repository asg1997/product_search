import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/core/utils/consts/app_fonts.dart';

class LogoWidget extends ConsumerWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'Product',
            style:
                AppFonts.linksButtonSmall.copyWith(color: AppColors.mainBlack),
          ),
          TextSpan(
            text: ' Search',
            style: AppFonts.linksButtonSmall
                .copyWith(color: AppColors.mainYellow1),
          ),
        ],
      ),
    );
  }
}
