import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/core/utils/consts/app_fonts.dart';

class MainAppBarWidget extends ConsumerWidget implements PreferredSizeWidget {
  const MainAppBarWidget({
    this.transparent = false,
    super.key,
  });

  final bool transparent;
  @override
  Size get preferredSize => const Size(double.infinity, 44);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
        backgroundColor: transparent ? Colors.transparent : Colors.white,
        centerTitle: true,
        elevation: 0,

        // НАЗВАНИЕ
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'Product',
                  style: AppFonts.linksButtonSmall
                      .copyWith(color: AppColors.mainBlack)),
              TextSpan(
                  text: ' Search',
                  style: AppFonts.linksButtonSmall
                      .copyWith(color: AppColors.mainYellow1)),
            ],
          ),
        ));
  }
}
