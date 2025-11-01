import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_dialog.dart';
import 'show_employee_data.dart';

Future<dynamic> showEmployeeDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'بيانات حساب الموظف',
        message: '',
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.85,
        ),
        child: ShowEmployeeData(),
      );
    },
  );
}
