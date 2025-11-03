import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_search_field.dart';
import 'add_employee_button.dart';
import 'employees_selector_field.dart';

class EmployeesViewHeader extends StatelessWidget {
  const EmployeesViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isMobile = SizeConfig.isMobile();
    return Row(
      spacing: 8,
      children: [
        Expanded(flex: 2, child: CustomSearchField(hintText: 'ابحث عن موظف')),
        if (!isMobile) const Spacer(flex: 3),
        EmployeesSelectorField(),
        if (!isMobile) AddEmployeeButton(),
      ],
    );
  }
}
