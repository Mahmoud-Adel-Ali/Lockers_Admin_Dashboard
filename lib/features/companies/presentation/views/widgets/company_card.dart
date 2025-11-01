import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/size_config.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Spacer(),
          CircleAvatar(
            radius: max(SizeConfig.width * 0.025, 40),
            child: Image.asset(
              Assets.imagesTestCompanyImage,
              height: 100,
              width: 100,
            ),
          ),
          const Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Text(
                  'شركة حمدون للإستيراد والتصدير',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.style16w500(
                    context,
                  ).copyWith(color: AppColors.black),
                ),
                SizedBox(height: 4),
                Text(
                  '+20 0109876543',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.style16w400(
                    context,
                  ).copyWith(color: AppColors.black),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
