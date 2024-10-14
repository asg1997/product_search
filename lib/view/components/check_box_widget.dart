import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/core/utils/consts/app_fonts.dart';
import 'package:product_search/resources/resources.dart';

class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget({
    required this.isChecked,
    required this.onChanged,
    required this.label, // Добавляем подпись для каждого чекбокса
    super.key,
  });

  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked); // Меняем состояние при нажатии
      },
      child: Row(
        children: [
          Image.asset(
            isChecked ? AppImages.checkFill : AppImages.checkUnfill,
          ),
          const Gap(8),
          Text(
            label, // Используем переданную подпись
            style: AppFonts.medium16.copyWith(
              color: isChecked ? AppColors.mainBlack : AppColors.mainDarkGray,
            ),
          ),
        ],
      ),
    );
  }
}
