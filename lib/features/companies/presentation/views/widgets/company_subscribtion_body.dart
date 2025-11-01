import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import 'custom_circle_percent_indicator.dart';

class CompanySubscribtionBody extends StatelessWidget {
  const CompanySubscribtionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.filedGrey,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        children: [
          SizedBox(height: 32),
          CustomCirclePercentIndicator(text: '13\nحجز متبقي', percent: 0.25),
          //
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
