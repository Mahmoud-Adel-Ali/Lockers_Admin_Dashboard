import 'package:flutter/material.dart';

import '../../../../../core/models/unit_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/views/show_location_view.dart';
import '../../../../../core/widgets/dialog_helper.dart';

class MaintenanceUnitCard extends StatelessWidget {
  const MaintenanceUnitCard({super.key, required this.unit});
  final UnitModel unit;
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
                        'الوحده رقم 1',
                        style: AppTextStyles.style20w500(
                          context,
                        ).copyWith(color: AppColors.white),
                      ),
                      Text(
                        '132 خزينه',
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
                  decoration: const BoxDecoration(
                    color: AppColors.filedGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      // topRight: Radius.circular(16),
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
                  desc: 'هل ترغب في إعادة الوحده رقم 1 إلي العمل',
                  onOk: () {
                    DialogHelper.showSuccessDialog(
                      context,
                      title: 'تم',
                      desc: 'تم ارسال الوحده رقم 1 الى العمل بنجاح',
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
