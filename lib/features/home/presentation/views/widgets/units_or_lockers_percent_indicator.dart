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
  });
  final String title;
  final String textOne;
  final String textTwo;
  final double percentIndecator;
  final String textIndecator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 240,
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
                      ),
                      TitleWithSmallCircle(
                        title: textTwo,
                        color: AppColors.orange,
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
  });
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: AppTextStyles.style18w400(context)),
      leading: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
