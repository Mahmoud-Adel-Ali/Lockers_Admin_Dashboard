import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../data/models/company_employee_model.dart';
import 'show_employee_data.dart';

Future<dynamic> showEmployeeDialog(
  BuildContext context, {
  required CompanyEmployeeModel employee,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'بيانات حساب الموظف',
        message: '',
        constraints: BoxConstraints(maxWidth: 500, maxHeight: 400),
        child: ShowEmployeeData(employee: employee),
      );
    },
  );
}
