import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/utils/assets.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/dashboard_back_button.dart';
import '../../../../../core/widgets/filter_button.dart';
import '../../../../dashboard/data/enums/dashboard_type.dart';
import '../../../../dashboard/presentation/manager/dashboard_manager.dart';

class CompanyDetailsViewHeader extends StatelessWidget {
  const CompanyDetailsViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DashboardBackIcon(
          onPressed: () {
            context.read<DashboardManager>().changeView(
              DashboardType.ShippingCompanies,
            );
          },
        ),
        FilterButton(
          title: 'عرض الموظفين',
          activeIcon: Assets.imagesActiveEmployeesIcon,
          inactiveIcon: Assets.imagesInactiveEmployeesIcon,
          isSelected: false,
          onTap: () {},
        ),
      ],
    );
  }
}
