// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lockers_admin_dashboard/core/extensions/locker_extension.dart';
import 'package:lockers_admin_dashboard/core/extensions/unit_extension.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/check_unauthenticated.dart';
import '../../../../../core/functions/show_loading_dialog.dart';
import '../../../../../core/functions/snack_bar.dart';
import '../../../../../core/models/unit_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../../generated/l10n.dart';
import '../../../../dashboard/data/enums/dashboard_type.dart';
import '../../../../dashboard/presentation/manager/dashboard_manager.dart';
import '../../manager/units_provider.dart';
import 'edit_unit_dialog.dart';

class UnitCard extends StatelessWidget {
  const UnitCard({super.key, required this.unit});
  final UnitModel unit;

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<UnitsProvider>();
    return InkWell(
      onTap: () {
        prov.onSelectUnit(unit);
        context.read<DashboardManager>().changeView(DashboardType.UnitDetails);
      },
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
                    onTap: () => editUnitDialog(context, unit: unit),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(Assets.imagesEditIcon, width: 16),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SendToMaintenanceButton(unit: unit),
          ],
        ),
      ),
    );
  }
}

class SendToMaintenanceButton extends StatelessWidget {
  const SendToMaintenanceButton({super.key, required this.unit});
  final UnitModel unit;

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<UnitsProvider>();
    return InkWell(
      onTap: () {
        DialogHelper.showQuestionDialog(
          context,
          title: 'الصيانه',
          desc: 'هل تريد ارسال الوحده للصيانه',
          onOk: () async {
            //* Show Loading Dialog
            showLoadingDialog(context);

            await prov.sendUnitToMantenance(id: unit.id);

            //* Close Loading Dialog
            Navigator.pop(context);

            if (prov.checkSendingUnitToMantenance == true) {
              showSuccessSnackBar(context, msg: prov.message);
            } else if (prov.checkSendingUnitToMantenance == false) {
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
              'إرسال إلي الصيانة',
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
