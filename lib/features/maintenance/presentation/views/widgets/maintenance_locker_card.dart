import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/extensions/locker_extension.dart';
import 'package:lockers_admin_dashboard/core/extensions/unit_extension.dart';

import '../../../../../core/functions/is_arabic.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/views/show_location_view.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../data/models/maintenance_locker_model.dart';

class MaintenanceLockerCard extends StatelessWidget {
  const MaintenanceLockerCard({super.key, required this.locker});
  final MaintenanceLockerModel locker;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.phosphorGreen,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        locker.lockerNumber.toLockerNumberString(
                          context,
                          withEmoji: true,
                        ),
                        style: AppTextStyles.style20w500(
                          context,
                        ).copyWith(color: AppColors.white),
                      ),
                      Text(
                        locker.unitNumber.toUnitString(context),
                        style: AppTextStyles.style16w500(
                          context,
                        ).copyWith(color: AppColors.white),
                      ),
                    ],
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.of(
                        context,
                      ).pushNamed(ShowLocationView.routeName);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(Assets.imagesGoogleMap, width: 16),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.filedGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: isArabic() ? Radius.circular(16) : Radius.zero,
                      topRight: isArabic() ? Radius.zero : Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    'سوهاج - حي شرق',
                    style: AppTextStyles.style14w500(context),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                DialogHelper.showQuestionDialog(
                  context,
                  title: 'الصيانه',
                  desc: 'هل ترغب في إعادة الخزينه رقم 23 إلي العمل',
                  onOk: () {
                    DialogHelper.showSuccessDialog(
                      context,
                      title: 'تم',
                      desc: 'تم ارسال الخزينه رقم 23 الى العمل بنجاح',
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  color: AppColors.main,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'إرجاع إلي العمل',
                      style: AppTextStyles.style14w500(
                        context,
                      ).copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
