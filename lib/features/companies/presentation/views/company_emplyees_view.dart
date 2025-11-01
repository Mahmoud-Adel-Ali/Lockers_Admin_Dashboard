import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/dashboard_back_button.dart';
import '../../../dashboard/data/enums/dashboard_type.dart';
import '../../../dashboard/presentation/manager/dashboard_manager.dart';
import 'widgets/company_employees_grid_view.dart';
import 'widgets/employees_search_field.dart';

class CompanyEmplyeesView extends StatelessWidget {
  const CompanyEmplyeesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DashboardBackIcon(
              onPressed: () {
                context.read<DashboardManager>().changeView(
                  DashboardType.CompanyDetails,
                );
              },
            ),
            EmployeesSearchField(),
          ],
        ),
        SizedBox(height: 8),
        Expanded(child: CompanyEmployeesGridView()),
      ],
    );
  }
}
