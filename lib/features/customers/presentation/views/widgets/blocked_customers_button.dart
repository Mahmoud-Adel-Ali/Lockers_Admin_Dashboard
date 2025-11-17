import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../data/models/customer_model.dart';

class BlockedCustomersButton extends StatelessWidget {
  const BlockedCustomersButton({super.key, required this.customer});
  final CustomerModel customer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        DialogHelper.showQuestionDialog(
          context,
          title: 'تاكيد',
          desc: 'هل ترغب في  تفعيل الحساب ؟',
          onOk: () {
            DialogHelper.showSuccessDialog(
              context,
              title: 'تم',
              desc: 'تم التفعيل بنجاح',
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.phosphorGreen,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Center(
          child: Text(
            'تفعيل الحساب',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.style16w500(
              context,
            ).copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
