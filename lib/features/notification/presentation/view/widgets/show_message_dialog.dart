import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_dialog.dart';

Future<dynamic> showMessageDialog(
  BuildContext context, {
  required String title,
  required String message,
  BoxConstraints? constraints,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: title,
        message: message,
        constraints: constraints,
      );
    },
  );
}
