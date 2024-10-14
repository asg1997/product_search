import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/core/utils/consts/app_fonts.dart';
import 'package:product_search/resources/resources.dart';

class MainButton extends ConsumerWidget {
  const MainButton({
    required this.title,
    required this.onTap,
    this.isLoading = false,
    this.isActive = true,
    this.unfocusOnTap = true,
    super.key,
  });

  final String title;
  final VoidCallback onTap;
  final bool isLoading;
  final bool isActive;
  final bool unfocusOnTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isActive
            ? () {
                if (unfocusOnTap) FocusScope.of(context).unfocus();
                onTap();
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isActive ? AppColors.mainYellow1 : AppColors.mainLightGrey,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
        ),
        child: isLoading
            ? const Center(
                child: SizedBox.square(
                  dimension: 12,
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      style: AppFonts.linksButtonSmall
                          .copyWith(color: AppColors.mainBlack)),
                  const Gap(12),
                  Image.asset(
                    AppImages.checkCircleFill,
                  )
                ],
              ),
      ),
    );
  }
}
