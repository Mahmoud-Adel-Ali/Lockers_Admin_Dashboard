import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_search_field.dart';
import '../../manager/employees_provider.dart';
import 'add_employee_button.dart';
import 'employees_selector_field.dart';

class EmployeesViewHeader extends StatelessWidget {
  const EmployeesViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isMobile = SizeConfig.isMobile();
    var prov = context.watch<EmployeesProvider>();
    return Row(
      spacing: 8,
      children: [
        Expanded(
          flex: 2,
          child: CustomSearchField(
            hintText: 'ابحث عن موظف',
            controller: prov.searchController,
            onChanged: (val) {
              if (prov.checkGetAllEmployees == null) return;
              prov.getAllEmployees();
            },
          ),
        ),
        if (!isMobile) const Spacer(flex: 3),
        EmployeesSelectorField(),
        if (!isMobile) AddEmployeeButton(),
      ],
    );
  }
}
