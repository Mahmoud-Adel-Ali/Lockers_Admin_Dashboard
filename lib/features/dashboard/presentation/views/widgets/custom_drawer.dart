import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import 'admin_profile_button.dart';
import 'custom_drawer_list_view.dart';
import 'logout_button.dart';
import 'notification_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270.0,
      decoration: BoxDecoration(color: AppColors.main),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
            child: Row(
              children: [
                Expanded(child: AdminProfileButton()),
                NotificationButton(),
              ],
            ),
          ),
          SizedBox(height: 24),
          Expanded(child: CustomDrawerListView()),
          SizedBox(height: 24),
          // ChangeLanguageButton(),
          LogoutButton(),
        ],
      ),
    );
  }
}
