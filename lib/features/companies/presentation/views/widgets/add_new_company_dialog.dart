import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_dialog.dart';
import '../../manager/companies_provider.dart';
import 'add_new_company_form.dart';

Future<dynamic> addNewCompanyDialog(BuildContext context) {
  context.read<CompaniesProvider>().clearControllers();
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'إضافة شركة جديد',
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.95,
        ),
        child: const AddNewCompanyForm(),
      );
    },
  );
}
