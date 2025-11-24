import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_dialog.dart';
import 'edit_package_form.dart';

Future<dynamic> editPackageDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'تعديل بيانات الباقة',
        constraints: BoxConstraints(maxWidth: 500, maxHeight: 460),
        child: const EditPackageForm(),
      );
    },
  );
}
