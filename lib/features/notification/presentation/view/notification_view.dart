import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'widgets/filter_notification_section.dart';
import 'widgets/notification_list_view.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  static const routeName = '/NotificationView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(flexibleSpace: Container(color: AppColors.white)),
      body: NotificationViewBody(),
    );
  }
}

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
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
              Expanded(child: FilterNotificationSection()),
            ],
          ),
          SizedBox(height: 16),
          Expanded(child: NotificationListView()),
        ],
      ),
    );
  }
}
