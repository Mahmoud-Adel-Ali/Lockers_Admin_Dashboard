import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class HeaderUnitInfoSection extends StatelessWidget {
  const HeaderUnitInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: const [
        UnitInfoItem(title: 'خزينة', value: 25),
        UnitInfoItem(title: 'في الصيانة', value: 1),
        UnitInfoItem(title: 'متاحة', value: 12),
        UnitInfoItem(title: 'محجوز', value: 12),
      ],
    );
  }
}

class UnitInfoItem extends StatelessWidget {
  const UnitInfoItem({super.key, required this.title, required this.value});
  final String title;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.whiteGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(value.toString(), style: AppTextStyles.style16w500(context)),
          const SizedBox(width: 4),
          Text(
            title,
            style: AppTextStyles.style14w400(
              context,
            ).copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
