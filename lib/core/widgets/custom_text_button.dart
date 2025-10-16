import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.title,
    required this.onTap,
    this.hasUnderLine = false,
    this.textColor = AppColors.purple,
  });

  final String title;
  final VoidCallback onTap;
  final bool hasUnderLine;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: AppTextStyles.style12w700(context).copyWith(color: textColor),
      ),
    );
  }
}
