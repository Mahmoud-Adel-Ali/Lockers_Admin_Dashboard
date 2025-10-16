import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/size_config.dart';
import 'widgets/filter_notification_section.dart';
import 'widgets/notification_list_view.dart';

class Notificationview extends StatelessWidget {
  const Notificationview({super.key});
  static const String routeName = 'notification';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: min(SizeConfig.width * 0.8, 500),
      backgroundColor: AppColors.white,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      // elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'الاشعارات',
                  style: AppTextStyles.style14w500(
                    context,
                  ).copyWith(color: AppColors.main),
                ),
              ],
            ),
            FilterNotificationSection(),
            Expanded(child: NotificationListView()),
          ],
        ),
      ),
    );
  }
}
