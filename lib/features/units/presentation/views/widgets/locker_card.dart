// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lockers_admin_dashboard/core/enum/locker_size.dart';
import 'package:lockers_admin_dashboard/core/extensions/locker_extension.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/check_unauthenticated.dart';
import '../../../../../core/functions/is_arabic.dart';
import '../../../../../core/functions/show_loading_dialog.dart';
import '../../../../../core/functions/snack_bar.dart';
import '../../../../../core/models/locker_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../../generated/l10n.dart';
import '../../../../maintenance/presentation/manager/maintenance_provider.dart';
import '../../manager/units_provider.dart';
import 'edit_locker_dialog.dart';

class LockerCard extends StatelessWidget {
  const LockerCard({super.key, required this.locker});
  final LockerModel locker;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black2,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
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
                Text(
                  locker.lockerNumber.toLockerNumberString(
                    context,
                    withEmoji: true,
                  ),
                  style: AppTextStyles.style16w700(
                    context,
                  ).copyWith(color: AppColors.main),
                ),

                InkWell(
                  onTap: () => editLockerDialog(context, locker: locker),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.whiteGrey,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(Assets.imagesEditIcon, width: 16),
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
                  color: AppColors.whiteGrey,
                  borderRadius: BorderRadius.only(
                    topRight: isArabic() ? Radius.zero : Radius.circular(16),
                    topLeft: isArabic() ? Radius.circular(16) : Radius.zero,
                  ),
                ),
                child: Text(
                  isArabic() ? locker.size.arName : locker.size.enName,
                  style: AppTextStyles.style16w500(context),
                ),
              ),
            ],
          ),
          SendLockerButton(locker: locker),
        ],
      ),
    );
  }
}

class SendLockerButton extends StatelessWidget {
  const SendLockerButton({super.key, required this.locker});
  final LockerModel locker;
  @override
  Widget build(BuildContext context) {
    var prov = context.watch<UnitsProvider>();
    return InkWell(
      onTap: () {
        DialogHelper.showQuestionDialog(
          context,
          title: 'الصيانه',
          desc: 'هل تريد ارسال الخزنه للصيانه',
          onOk: () async {
            //* Show Loading Dialog
            showLoadingDialog(context);

            await prov.sendLockerToMantenance(id: locker.id);

            ///* Close Loading Dialog
            Navigator.pop(context);

            if (prov.checkSendingLockerToMantenance == true) {
              showSuccessSnackBar(context, msg: prov.message);
              context.read<MaintenanceProvider>()
                ..getRegionsOfMaintenanceLockers()
                ..getMaintenanceLockers();
            } else if (prov.checkSendingLockerToMantenance == false) {
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
          color: AppColors.phosphorGreen,
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
