// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/check_unauthenticated.dart';
import '../../../../../core/functions/show_loading_dialog.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/enums/customer_type.dart';
import '../customers_provider.dart';

Future<void> updateCustomerStatus(
  BuildContext context, {
  required int id,
  required CustomerType newStatus,
}) async {
  var prov = context.read<CustomersProvider>();

  //* Show Loading Dialog
  showLoadingDialog(context);

  await prov.updateCustomerStatus(id: id, status: newStatus);

  //* Close Loading Dialog
  Navigator.pop(context);

  if (prov.checkUpdateCustomerStatus == true) {
  } else if (prov.checkUpdateCustomerStatus == false) {
    checkUnauthenticated(context, msg: prov.message);
    DialogHelper.showErrorDialog(
      context,
      title: S.of(context).error,
      desc: prov.message,
    );
  }
}
