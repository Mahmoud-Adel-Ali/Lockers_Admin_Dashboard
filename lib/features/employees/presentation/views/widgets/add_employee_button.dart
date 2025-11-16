import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/filter_button.dart';
import '../../manager/employees_provider.dart';
import 'add_new_employee_dialog.dart';

class AddEmployeeButton extends StatelessWidget {
  const AddEmployeeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilterButton(
      title: 'إضافة موظف جديد',
      activeIcon: Assets.imagesAddIcon,
      inactiveIcon: Assets.imagesAddIcon,
      isSelected: false,
      onTap: () {
        context.read<EmployeesProvider>().clearAllData();
        addNewEmployeeDialog(context);
      },
    );
  }
}
