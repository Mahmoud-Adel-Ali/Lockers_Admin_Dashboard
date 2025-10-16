import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../manager/dashboard_manager.dart';
import '../manager/functions/get_current_company_dashboard_view.dart';
import 'widgets/admin_dashboard_app_bar.dart';
import 'widgets/dashboard_view_header.dart';

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({super.key});
  static const routeName = 'company_dashboard_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<DashboardManager>().drawerKey,
      // drawer: Notificationview(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          spacing: 16,
          children: [
            AdminDashboardAppBar(),
            DashboardViewHeader(),
            Expanded(
              child: getCurrentCompanyDashboardView(
                context.watch<DashboardManager>().type,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
