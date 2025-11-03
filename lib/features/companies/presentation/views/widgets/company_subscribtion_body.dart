import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'company_info_item.dart';
import '../../../../../core/widgets/custom_circle_percent_indicator.dart';

class CompanySubscribtionBody extends StatelessWidget {
  const CompanySubscribtionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: AppColors.filedGrey,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        spacing: 8,
        children: [
          ListTile(
            title: Text('الإستهلاك', style: AppTextStyles.style20w500(context)),
            trailing: Text(
              'Standard',
              style: AppTextStyles.style20w500(context),
            ),
          ),
          CustomCirclePercentIndicator(text: '13\nحجز متبقي', percent: 0.7),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 8,
              children: [
                CompanyInfoItem(title: 'عدد الحجوزات :', value: '232 حجز'),
                CompanyInfoItem(title: 'سعر الباقة :', value: '5000 جنيه'),
                CompanyInfoItem(title: 'مدة الباقة :', value: '3 شهر'),
              ],
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
