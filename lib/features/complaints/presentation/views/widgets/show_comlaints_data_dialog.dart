import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/widgets/custom_text_form_field.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../data/models/complaint_model.dart';
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
        bottomWidget: ReplySection(),
        child: ShowComplaintDataForm(complaint: complaint),
      );
    },
  );
}

class ReplySection extends StatelessWidget {
  const ReplySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomTextFormField(hintText: 'الرد')),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            DialogHelper.showSuccessDialog(
              context,
              title: 'تم',
              desc: 'تم ارسال الرد بنجاح',
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.main,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Icon(Icons.send, color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
