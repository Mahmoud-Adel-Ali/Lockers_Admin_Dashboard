import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';

class CompanySubscribtionHeader extends StatelessWidget {
  const CompanySubscribtionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      constraints: const BoxConstraints(maxWidth: 700),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(Assets.imagesNoteIcon),
              const SizedBox(width: 16),
              Text(
                '232 حجز',
                style: AppTextStyles.style14w400(
                  context,
                ).copyWith(color: AppColors.white),
              ),
            ],
          ),
          Text(
            '1500 جنية',
            style: AppTextStyles.style14w400(
              context,
            ).copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
