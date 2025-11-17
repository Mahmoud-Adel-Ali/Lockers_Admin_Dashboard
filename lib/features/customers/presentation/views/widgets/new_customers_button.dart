import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../data/models/customer_model.dart';

class NewCustomersButton extends StatelessWidget {
  const NewCustomersButton({super.key, required this.customer});
  final CustomerModel customer;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                DialogHelper.showQuestionDialog(
                  context,
                  title: 'تاكيد',
                  desc: 'هل ترغب في قبول الحساب ؟',
                  onOk: () {
                    DialogHelper.showSuccessDialog(
                      context,
                      title: 'تم',
                      desc: 'تم قبول الحساب بنجاح',
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.main,
                  borderRadius: BorderRadius.only(
                    // bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Center(
                  child: Text(
                    'قبول',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.style16w500(
                      context,
                    ).copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: InkWell(
              onTap: () {
                DialogHelper.showQuestionDialog(
                  context,
                  title: 'تاكيد',
                  desc: 'هل ترغب في حظر الحساب ؟',
                  onOk: () {
                    DialogHelper.showSuccessDialog(
                      context,
                      title: 'تم',
                      desc: 'تم حظر الحساب بنجاح',
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.phosphorGreen,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    // bottomRight: Radius.circular(16),
                  ),
                ),
                child: Center(
                  child: Text(
                    'حظر',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.style16w500(
                      context,
                    ).copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
