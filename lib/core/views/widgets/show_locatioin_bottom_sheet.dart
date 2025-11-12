import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/location_details_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/assets.dart';
import '../../widgets/profile_text_field.dart';

Future<dynamic> showLocationDetailsBottomSheet(
  BuildContext context, {
  required LocationDetailsModel locationModel,
}) {
  return showModalBottomSheet(
    context: context,
    sheetAnimationStyle: AnimationStyle(
      curve: Curves.bounceInOut,
      duration: Duration(seconds: 1),
      reverseCurve: Curves.bounceInOut,
      reverseDuration: Duration(seconds: 1),
    ),
    enableDrag: true,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'تفاصيل الموقع',
                  textAlign: TextAlign.start,
                  style: AppTextStyles.style16w400(context),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(50),
                  child: Transform.rotate(
                    angle: 3.14 * 3 / 2,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.filedGrey,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(Assets.imagesArrowBackIcon),
                    ),
                  ),
                ),
              ],
            ),
            AbsorbPointer(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 10,
                  children: [
                    ProfileTextField(
                      title: 'المدينة :',
                      controller: TextEditingController(
                        text: locationModel.city,
                      ),
                    ),
                    ProfileTextField(
                      title: 'الحي :',
                      controller: TextEditingController(
                        text: locationModel.neighborhood,
                      ),
                    ),
                    ProfileTextField(
                      title: 'الشارع :',
                      controller: TextEditingController(
                        text: locationModel.street,
                      ),
                    ),
                    ProfileTextField(
                      title: 'رقم المبني :',
                      controller: TextEditingController(
                        text: locationModel.buildingNum,
                      ),
                    ),
                    ProfileTextField(
                      title: 'عنوان إضافي :',
                      controller: TextEditingController(
                        text: locationModel.administrativeArea,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      );
    },
  );
}
