import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_dialog.dart';
import 'add_new_package_form.dart';

Future<dynamic> addNewPackageDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'إضافة باقة جديدة',
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.7,
        ),
        child: const AddNewPackageForm(),
      );
    },
  );
}
