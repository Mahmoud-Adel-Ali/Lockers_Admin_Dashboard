import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import 'admin_profile_button.dart';
import 'dashboard_features_buttons.dart';
import 'notification_button.dart';

class AdminDashboardAppBar extends StatelessWidget {
  const AdminDashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AdminProfileButton(),
        NotificationButton(),
        SizedBox(width: 42),
        Expanded(child: DashboardFeaturesButtons()),
        SizedBox(width: 42),
        Image.asset(Assets.imagesLogo),
      ],
    );
  }
}
