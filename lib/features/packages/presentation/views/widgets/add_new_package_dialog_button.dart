// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/check_unauthenticated.dart';
import '../../../../../core/functions/show_loading_dialog.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/packages_provider.dart';

class AddNewPackageDialogButton extends StatelessWidget {
  const AddNewPackageDialogButton({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<PackagesProvider>();
    return CustomButton(
      text: 'اضافة',
      onPressed: () async {
        if (prov.formKey.currentState!.validate()) {
          //* Show Loading Dialog
          showLoadingDialog(context);

          await prov.addNewPackage();

          //* Close Loading Dialog
          Navigator.pop(context);

          if (prov.checkUpdatingPackage == true) {
            //* Close Dialog
            Navigator.pop(context);
            DialogHelper.showSuccessDialog(
              context,
              title: 'تم',
              desc: prov.message,
            );
          } else if (prov.checkUpdatingPackage == false) {
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
