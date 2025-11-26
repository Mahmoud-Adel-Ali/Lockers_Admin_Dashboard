import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_circle_percent_indicator.dart';
import 'section_header_list_tile.dart';

class UnitsOrLockersPercentIndicator extends StatelessWidget {
  const UnitsOrLockersPercentIndicator({
    super.key,
    required this.title,
    required this.textOne,
    required this.textTwo,
    required this.percentIndecator,
    required this.textIndecator,
    required this.totalText,
    required this.totalValue,
    required this.countAvailable,
    required this.countInMaintenance,
  });
  final String title;
  final String textOne;
  final String textTwo;
  final double percentIndecator;
  final String textIndecator;
  final String totalText;
  final int totalValue;
  final int countAvailable;
  final int countInMaintenance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.filedGrey, width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          SectionHeaderListTile(
            title: title,
            svgIcon: Assets.imagesActiveUnitsIcon,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleWithSmallCircle(
                        title: textOne,
                        color: AppColors.blue,
                        count: countAvailable,
                      ),
                      TitleWithSmallCircle(
                        title: textTwo,
                        color: AppColors.orange,
                        count: countInMaintenance,
                      ),
                    ],
                  ),
                ),

                CustomCirclePercentIndicator(
                  percent: percentIndecator,
                  text: textIndecator,
                ),
              ],
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(totalText, style: AppTextStyles.style20w500(context)),
            trailing: Text(
              ' ( $totalValue ) ',
              style: AppTextStyles.style16w700(context),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleWithSmallCircle extends StatelessWidget {
  const TitleWithSmallCircle({
    super.key,
    required this.title,
    required this.color,
    required this.count,
  });
  final String title;
  final Color color;
  final int count;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: title, style: AppTextStyles.style16w500(context)),
            TextSpan(
              text: ' ( $count )',
              style: AppTextStyles.style20w700(context).copyWith(color: color),
            ),
          ],
        ),
      ),
      leading: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
