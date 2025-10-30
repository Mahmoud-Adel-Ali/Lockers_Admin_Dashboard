import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../notification/presentation/view/notification_view.dart';
import '../manager/dashboard_manager.dart';
import '../manager/functions/get_current_company_dashboard_view.dart';
import 'widgets/admin_dashboard_app_bar.dart';
import 'widgets/custom_drawer.dart';

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({super.key});
  static const routeName = 'company_dashboard_view';

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isDesktop = SizeConfig.isDesktop();
    return Scaffold(
      key: context.read<DashboardManager>().drawerKey,
      drawer: isDesktop
          ? SizedBox(width: 500, child: NotificationViewBody())
          : CustomDrawer(),
      appBar: isDesktop
          ? null
          : AppBar(
              backgroundColor: AppColors.babyBlue,
              flexibleSpace: Container(color: AppColors.babyBlue),
              title: AdminDashboardAppBar(),
            ),
      body: Row(
        children: [
          if (isDesktop) CustomDrawer(),
          Expanded(
            child: Column(
              spacing: 16,
              children: [
                if (isDesktop) AdminDashboardAppBar(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Expanded(
                    child: getCurrentCompanyDashboardView(
                      context.watch<DashboardManager>().type,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
