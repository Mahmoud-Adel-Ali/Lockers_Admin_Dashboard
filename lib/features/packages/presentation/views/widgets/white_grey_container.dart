import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class WhiteGreyContainer extends StatelessWidget {
  const WhiteGreyContainer({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.filedGrey,
      ),
      child: Text(
        text,
        style: AppTextStyles.style14w400(
          context,
        ).copyWith(color: AppColors.black),
      ),
    );
  }
}
