import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.text = 'التالي',
    required this.onPressed,
    this.color = AppColors.glowGreen,
    this.textColor = AppColors.white,
    this.horizontal = 25,
  });
  final String text;
  final VoidCallback? onPressed;
  final Color color, textColor;
  final double horizontal;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: 10),
        child: Text(
          text,
          style: AppTextStyles.style20w400(
            context,
          ).copyWith(color: textColor, fontFamily: vexa),
        ),
      ),
    );
  }
}
