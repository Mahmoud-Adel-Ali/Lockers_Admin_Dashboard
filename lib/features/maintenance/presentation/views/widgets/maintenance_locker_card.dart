// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/extensions/locker_extension.dart';
import 'package:lockers_admin_dashboard/core/extensions/unit_extension.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/check_unauthenticated.dart';
import '../../../../../core/functions/convert_location_to_text.dart';
import '../../../../../core/functions/is_arabic.dart';
import '../../../../../core/functions/show_loading_dialog.dart';
import '../../../../../core/models/location_details_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/views/show_location_view.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/maintenance_locker_model.dart';
import '../../manager/maintenance_provider.dart';

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
                      LocationDetailsModel location = LocationDetailsModel(
                        latitude: locker.latitude,
                        longitude: locker.longitude,
                        city: locker.city,
                        neighborhood: locker.neighborhood,
                        street: locker.street,
                        buildingNum: locker.buildingNumber,
                        administrativeArea: locker.additionalAddress,
                      );
                      Navigator.of(context).pushNamed(
                        ShowLocationView.routeName,
                        arguments: location,
                      );
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
                    convertLocationToText(
                      context,
                      city: locker.city,
                      neighborhood: locker.neighborhood,
                    ),
                    style: AppTextStyles.style14w500(context),
                  ),
                ),
              ],
            ),
            MaintenanceLockerButton(locker: locker),
          ],
        ),
      ),
    );
  }
}

class MaintenanceLockerButton extends StatelessWidget {
  const MaintenanceLockerButton({super.key, required this.locker});

  final MaintenanceLockerModel locker;

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<MaintenanceProvider>();
    return InkWell(
      onTap: () {
        DialogHelper.showQuestionDialog(
          context,
          title: 'الصيانه',
          desc: 'هل ترغب في إعادة الخزينه إلي العمل',
          onOk: () async {
            //* Show Loading Dialog
            showLoadingDialog(context);

            await prov.deleteLockerFromMaintenance(lockerId: locker.id);

            //* Close Loading Dialog
            Navigator.pop(context);
            if (prov.checkDeleteLockerFromMaintenance == true) {
            } else if (prov.checkDeleteLockerFromMaintenance == false) {
              checkUnauthenticated(context, msg: prov.message);
              DialogHelper.showErrorDialog(
                context,
                title: S.of(context).error,
                desc: prov.message,
              );
            }
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
    );
  }
}
