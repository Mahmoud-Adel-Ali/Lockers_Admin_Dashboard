import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/profile_text_field.dart';
import '../../../data/models/complaint_model.dart';

class ShowComplaintDataForm extends StatelessWidget {
  const ShowComplaintDataForm({super.key, required this.complaint});
  final ComplaintModel complaint;
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: customCachedNetworkImageprovider(complaint.image),
              ),
            ),
            const SizedBox(),
            ProfileTextField(
              title: 'الإسم',
              controller: TextEditingController(text: complaint.name),
            ),
            ProfileTextField(
              title: 'رقم الهاتف',
              controller: TextEditingController(text: complaint.phone),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColors.filedGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'الشكوي: ',
                        style: AppTextStyles.style16w500(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          complaint.message,
                          style: AppTextStyles.style16w400(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
