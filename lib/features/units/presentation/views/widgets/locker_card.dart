import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import 'edit_locker_dialog.dart';

class LockerCard extends StatelessWidget {
  const LockerCard({super.key});

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
                  'الخزنه رقم 1',
                  style: AppTextStyles.style16w500(
                    context,
                  ).copyWith(color: AppColors.main),
                ),

                InkWell(
                  onTap: () => editLockerDialog(context),
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
          InkWell(
            onTap: () {
              DialogHelper.showQuestionDialog(
                context,
                title: 'الصيانه',
                desc: 'هل تريد ارسال الخزنه للصيانه',
                onOk: () {
                  DialogHelper.showSuccessDialog(
                    context,
                    title: 'تم',
                    desc: 'تم ارسال الخزنه للصيانه بنجاح',
                  );
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
          ),
        ],
      ),
    );
  }
}
