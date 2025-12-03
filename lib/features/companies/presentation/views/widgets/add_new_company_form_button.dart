// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/check_unauthenticated.dart';
import '../../../../../core/functions/show_loading_dialog.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../../generated/l10n.dart';
import '../../../../home/presentation/manager/home_provider.dart';
import '../../manager/companies_provider.dart';

class AddNewCompanyFormButton extends StatelessWidget {
  const AddNewCompanyFormButton({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<CompaniesProvider>();
    return CustomButton(
      text: 'إضافة',
      onPressed: () async {
        if (prov.formKey.currentState!.validate()) {
          //* Show Loading Dialog
          showLoadingDialog(context);

          await prov.addNewCompany();

          //* Close Loading Dialog
          Navigator.pop(context);

          if (prov.checkAddNewCompany == true) {
            //* Close Dialog
            Navigator.pop(context);

            //* Get Home Dashboard Data
            context.read<HomeProvider>().getHomeDashboardData();
          } else if (prov.checkAddNewCompany == false) {
            checkUnauthenticated(context, msg: prov.message);
            DialogHelper.showErrorDialog(
              context,
              title: S.of(context).error,
              desc: prov.message,
            );
          }
        }
      },
    );
  }
}
