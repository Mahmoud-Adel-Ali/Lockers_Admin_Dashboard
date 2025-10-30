import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../notification/presentation/view/notification_view.dart';
import '../../manager/dashboard_manager.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        var prov = context.read<DashboardManager>();
        if (prov.isDrawerOpen()) {
          prov.closeDrawer();
          Navigator.pushNamed(context, NotificationView.routeName);
        } else {
          prov.openDrawer();
        }
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
