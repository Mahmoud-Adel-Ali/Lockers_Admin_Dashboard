import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class LocationFilterButton extends StatelessWidget {
  const LocationFilterButton({
    super.key,
    required this.title,
    required this.isSelected,
    this.onTap,
    this.height = 45,
    this.activeColor = AppColors.main,
    this.inactiveColor = AppColors.whiteGrey,
  });
  final String title;
  final bool isSelected;
  final double? height;
  final VoidCallback? onTap;
  final Color activeColor, inactiveColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: kAnimationDuration),
        height: height,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected ? activeColor : inactiveColor,
        ),
        child: Center(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.style16w500(context).copyWith(
              color: isSelected ? inactiveColor : activeColor,
              fontFamily: tajawal,
            ),
          ),
        ),
      ),
    );
  }
}
