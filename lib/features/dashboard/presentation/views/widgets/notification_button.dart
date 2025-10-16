import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import '../../manager/dashboard_manager.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        context.read<DashboardManager>().openDrawer();
      },
      padding: EdgeInsets.all(24),
      height: 50,
      elevation: 0,
      color: AppColors.babyBlue,
      shape: CircleBorder(),
      child: SvgPicture.asset(
        Assets.imagesNotificationsIcon,
        width: 22,
        height: 22,
      ),
    );
  }
}
