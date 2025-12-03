// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/show_loading_dialog.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../../generated/l10n.dart';
import '../../../../home/presentation/manager/home_provider.dart';
import '../../../data/models/complaint_model.dart';
import '../../manager/complaints_provider.dart';

class ReplySection extends StatelessWidget {
  const ReplySection({super.key, required this.complaint});

  final ComplaintModel complaint;
  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ComplaintsProvider>();
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            hintText: 'الرد',
            controller: prov.replyController,
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: () async {
            if (prov.replyController.text.isEmpty) return;
            //* Show loading indicator
            showLoadingDialog(context);

            await prov.replyToComplaint(id: complaint.id);

            //* Close loading indicator
            Navigator.pop(context);

            if (prov.checkReplyingToComplaint == true) {
              //* Close dialog
              Navigator.pop(context);

              //* Get Home Dashboard Data
              context.read<HomeProvider>().getHomeDashboardData();
            } else if (prov.checkReplyingToComplaint == false) {
              DialogHelper.showErrorDialog(
                context,
                title: S.of(context).error,
                desc: prov.message,
              );
            }
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
