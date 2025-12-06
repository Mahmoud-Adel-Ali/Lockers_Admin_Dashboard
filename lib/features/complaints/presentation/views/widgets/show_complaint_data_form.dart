import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_info_field.dart';
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
            CustomInfoField(title: 'الإسم', info: complaint.name),
            CustomInfoField(title: 'رقم الهاتف', info: complaint.phone),
            CustomInfoField(
              title: 'الشكوي: ',
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        complaint.message,
                        style: AppTextStyles.style16w400(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
