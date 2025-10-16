import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.title,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.isSelected,
    this.onTap,
    this.height = 45,
    this.activeColor = AppColors.main,
    this.inactiveColor = AppColors.babyBlue,
  });
  final String title;
  final bool isSelected;
  final double? height;
  final VoidCallback? onTap;
  final String activeIcon, inactiveIcon;
  final Color activeColor, inactiveColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: kAnimationDuration),
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected ? activeColor : inactiveColor,
        ),
        child: Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(isSelected ? activeIcon : inactiveIcon),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.style16w400(context).copyWith(
                color: isSelected ? inactiveColor : activeColor,
                fontFamily: tajawal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
