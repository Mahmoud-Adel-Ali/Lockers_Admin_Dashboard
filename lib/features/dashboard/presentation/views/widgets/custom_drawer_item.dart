import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../data/models/dashboard_model.dart';

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });
  final DashboardModel item;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: kAnimationDuration),
        padding: EdgeInsets.symmetric(vertical: 8),
        color: isSelected ? AppColors.phosphorGreen : AppColors.main,
        child: Row(
          spacing: 10,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: kAnimationDuration),
              width: 3,
              height: 40,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.glowYellow : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(),
            SvgPicture.asset(item.activeIcon, height: 25),
            Expanded(
              child: Text(
                item.title,
                style: AppTextStyles.style16w500(
                  context,
                ).copyWith(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
