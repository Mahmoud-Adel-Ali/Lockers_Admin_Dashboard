// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../companies/presentation/manager/companies_provider.dart';
import '../../../complaints/presentation/manager/complaints_provider.dart';
import '../../../customers/presentation/manager/customers_provider.dart';
import '../../../employees/presentation/manager/employees_provider.dart';
import '../../../follow_up_reservations/presentation/manager/reservations_provider.dart';
import '../../../home/presentation/manager/home_provider.dart';
import '../../../maintenance/presentation/manager/maintenance_provider.dart';
import '../../../notification/presentation/view/notification_view.dart';
import '../../../packages/presentation/manager/packages_provider.dart';
import '../../../units/presentation/manager/units_provider.dart';
import '../manager/dashboard_manager.dart';
import '../manager/functions/get_current_company_dashboard_view.dart';
import '../manager/profile_provider.dart';
import 'widgets/admin_dashboard_app_bar.dart';
import 'widgets/custom_drawer.dart';

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({super.key});
  static const routeName = 'admin_dashboard_view';

  @override
  Widget build(BuildContext context) {
    var manager = context.read<DashboardManager>();
    Future.microtask(() {
      manager.init();
      context.read<ProfileProvider>().getAdminData();
    });
    Future.microtask(() {
      // another providers
      if (manager.isAdmin) context.read<HomeProvider>().getHomeDashboardData();
      if (manager.isAdmin || manager.manageShippingCompanies) {
        context.read<CompaniesProvider>().getAllCompanies();
      }
      if (manager.isAdmin || manager.manageUnits) {
        context.read<UnitsProvider>()
          ..getAllRegions()
          ..getAllUnits();
      }
      if (manager.isAdmin || manager.followReservations) {
        context.read<ReservationsProvider>()
          ..getAllRegions()
          ..getAllUnits();
      }
      if (manager.isAdmin) context.read<PackagesProvider>().getAllPackages();
      if (manager.isAdmin || manager.manageCustomers) {
        context.read<CustomersProvider>().getAllCustomers();
      }
      if (manager.isAdmin) context.read<EmployeesProvider>().getAllEmployees();
      if (manager.isAdmin || manager.manageComplaints) {
        context.read<ComplaintsProvider>().getAllComplaints();
      }
      if (manager.isAdmin || manager.manageMaintenance) {
        context.read<MaintenanceProvider>()
          ..getRegionsOfMaintenanceUnits()
          ..getRegionsOfMaintenanceLockers()
          ..getMaintenanceUnits()
          ..getMaintenanceLockers();
      }
    });
    return const AdminDashboardViewBody();
  }
}

class AdminDashboardViewBody extends StatelessWidget {
  const AdminDashboardViewBody({super.key});

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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
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
