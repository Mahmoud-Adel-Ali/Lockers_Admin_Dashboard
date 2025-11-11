import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../data/models/complaint_model.dart';
import 'reply_section.dart';
import 'show_complaint_data_form.dart';

Future<dynamic> showComplaintDataDialog(
  BuildContext context, {
  required ComplaintModel complaint,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.95,
        ),
        bottomWidget: ReplySection(complaint: complaint),
        child: ShowComplaintDataForm(complaint: complaint),
      );
    },
  );
}
