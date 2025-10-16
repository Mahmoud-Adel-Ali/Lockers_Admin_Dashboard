import 'package:flutter/material.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/size_config.dart';
import 'show_message_dialog.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          showMessageDialog(
            context,
            constraints: const BoxConstraints(maxWidth: 500, maxHeight: 300),
            title: "مرسل من Lockers",
            message:
                '''مرحبا بك في Lockers تم حجز ال Locker ........في سوهاج - جهينة الخدمة متاحة لك من الان للإستخدام''',
          );
        },
        child: Card(
          elevation: 0,
          // color: AppColors.white,
          child: ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            title: Text(
              '9 / 4 / 2025',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.style14w400(
                context,
              ).copyWith(fontFamily: tajawal, color: AppColors.grey),
            ),
            subtitle: Text(
              'مرحبا بك في Lockers تم حجز ال Locker ........ في سوهاج - جهينة الخدمة متاحة لك من الان للإستخدام',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.style14w400(
                context,
              ).copyWith(fontFamily: tajawal, color: AppColors.grey),
            ),
            trailing: SizedBox(
              width: SizeConfig.width * 0.04,
              height: SizeConfig.height * 0.075,
              child: Stack(
                children: [
                  Image.asset(Assets.imagesMessage),
                  Positioned(
                    top: -2,
                    right: -2,
                    child: CircleAvatar(
                      backgroundColor: AppColors.glowGreen,
                      radius: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
