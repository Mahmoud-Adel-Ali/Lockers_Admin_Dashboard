import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_styles.dart';

class CustomCirclePercentIndicator extends StatelessWidget {
  final double percent;
  final String text;

  const CustomCirclePercentIndicator({
    super.key,
    required this.percent,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 80,
      lineWidth: 20,
      percent: percent,
      circularStrokeCap: CircularStrokeCap.round,
      animation: true,
      animationDuration: 1500,
      center: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles.style16w700(
          context,
        ).copyWith(color: Colors.black87),
      ),
      backgroundColor: AppColors.orange,
      progressColor: AppColors.blue,
    );
  }
}
