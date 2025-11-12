import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/utils/assets.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/dashboard_back_button.dart';
import '../../../../../core/widgets/filter_button.dart';
import '../../../../dashboard/data/enums/dashboard_type.dart';
import '../../../../dashboard/presentation/manager/dashboard_manager.dart';
import '../../manager/companies_provider.dart';

class CompanyDetailsViewHeader extends StatelessWidget {
  const CompanyDetailsViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var read = context.read<DashboardManager>();
    var prov = context.watch<CompaniesProvider>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DashboardBackIcon(
          onPressed: () {
            read.changeView(DashboardType.ShippingCompanies);
          },
        ),
        FilterButton(
          title: 'عرض الموظفين',
          activeIcon: Assets.imagesActiveEmployeesIcon,
          inactiveIcon: Assets.imagesInactiveEmployeesIcon,
          isSelected: false,
          onTap: () {
            if (prov.checkGetCompanyDetails == true) {
              read.changeView(DashboardType.CompanyEmployees);
            }
          },
        ),
      ],
    );
  }
}
