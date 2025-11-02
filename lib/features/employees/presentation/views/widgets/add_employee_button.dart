import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/filter_button.dart';
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
      onTap: () => addNewEmployeeDialog(context),
    );
  }
}
