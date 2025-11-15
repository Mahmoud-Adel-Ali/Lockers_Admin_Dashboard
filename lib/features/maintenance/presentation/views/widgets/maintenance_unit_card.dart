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
import '../../../../../core/models/unit_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/views/show_location_view.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../../generated/l10n.dart';
import '../../../../units/presentation/manager/units_provider.dart';
import '../../manager/maintenance_provider.dart';

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
                        unit.unitNumber.toUnitString(context),
                        style: AppTextStyles.style20w500(
                          context,
                        ).copyWith(color: AppColors.white),
                      ),
                      Text(
                        unit.countLockers.toLockerString(context),
                        style: AppTextStyles.style16w500(
                          context,
                        ).copyWith(color: AppColors.white),
                      ),
                    ],
                  ),

                  InkWell(
                    onTap: () {
                      LocationDetailsModel location = LocationDetailsModel(
                        latitude: unit.latitude,
                        longitude: unit.longitude,
                        city: unit.city,
                        neighborhood: unit.neighborhood,
                        street: unit.street,
                        buildingNum: unit.buildNumber,
                        administrativeArea: unit.additionAddress,
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
                      city: unit.city,
                      neighborhood: unit.neighborhood,
                    ),
                    style: AppTextStyles.style14w500(context),
                  ),
                ),
              ],
            ),
            MaintenanceUnitButton(unit: unit),
          ],
        ),
      ),
    );
  }
}

class MaintenanceUnitButton extends StatelessWidget {
  const MaintenanceUnitButton({super.key, required this.unit});

  final UnitModel unit;

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<MaintenanceProvider>();
    return InkWell(
      onTap: () {
        DialogHelper.showQuestionDialog(
          context,
          title: 'الصيانه',
          desc: 'هل ترغب في إعادة الوحده إلي العمل',
          onOk: () async {
            //* Show Loading Dialog
            showLoadingDialog(context);

            await prov.deleteUnitFromMaintenance(unitId: unit.id);

            //* Close Loading Dialog
            Navigator.pop(context);
            if (prov.checkDeleteUnitFromMaintenance == true) {
              context.read<UnitsProvider>()
                ..getAllRegions()
                ..getAllUnits();
            } else if (prov.checkDeleteUnitFromMaintenance == false) {
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
