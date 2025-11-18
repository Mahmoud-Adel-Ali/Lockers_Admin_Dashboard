import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/api_error_widget.dart';
import '../../../../core/widgets/empty_grid_view_widget.dart';
import '../manager/employees_provider.dart';
import 'widgets/add_new_employee_dialog.dart';
import 'widgets/employees_grid_view.dart';
import 'widgets/employees_view_header.dart';

class EmployeesView extends StatelessWidget {
  const EmployeesView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<EmployeesProvider>();
    SizeConfig.init(context);
    bool isMobile = SizeConfig.isMobile();
    return prov.checkGetAllEmployees == false
        ? ApiErrorView(msg: prov.message, onRetry: prov.getAllEmployees)
        : Scaffold(
            floatingActionButton: !isMobile
                ? null
                : FloatingActionButton(
                    backgroundColor: AppColors.main,
                    onPressed: () {
                      prov.clearAllData();
                      addNewEmployeeDialog(context);
                    },
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
            body: Column(
              children: [
                const SizedBox(height: 8),
                EmployeesViewHeader(),
                const SizedBox(height: 8),
                Expanded(
                  child: prov.filteredEmployees.isEmpty
                      ? EmptyGridViewWidget(msg: 'لا يوجد موظفين بعد')
                      : EmployeesGridView(),
                ),
                const SizedBox(height: 8),
              ],
            ),
          );
  }
}
