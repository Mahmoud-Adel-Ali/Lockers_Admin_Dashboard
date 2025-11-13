import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/units_provider.dart';

class HeaderUnitInfoSection extends StatelessWidget {
  const HeaderUnitInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<UnitsProvider>();
    var unit = prov.selectedUnit;
    return Skeletonizer(
      enabled: prov.checkGettingUnitDetails == null,
      child: Row(
        spacing: 8,
        children: [
          UnitInfoItem(title: 'خزينة', value: unit?.countLockers ?? 0),
          UnitInfoItem(title: 'متاحة', value: unit?.countAvailable ?? 0),
          UnitInfoItem(title: 'محجوز', value: unit?.countReserved ?? 0),
          UnitInfoItem(title: 'جاري الحجز', value: unit?.countProgress ?? 0),
          UnitInfoItem(
            title: 'في الصيانة',
            value: unit?.countUnderMaintenance ?? 0,
          ),
        ],
      ),
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
