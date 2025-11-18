import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class CompanyInfoItem extends StatelessWidget {
  const CompanyInfoItem({
    super.key,
    required this.title,
    required this.value,
    this.trailing,
    this.onTap,
  });
  final String title, value;
  final Widget? trailing;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        spacing: 8,
        children: [
          Row(
            children: [
              Text(
                title,
                style: AppTextStyles.style16w700(
                  context,
                ).copyWith(color: AppColors.main),
              ),
            ],
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                trailing: trailing,
                title: Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.style14w500(
                    context,
                  ).copyWith(color: AppColors.black2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
