import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class SectionHeaderListTile extends StatelessWidget {
  const SectionHeaderListTile({
    super.key,
    required this.title,
    required this.svgIcon,
    this.color = AppColors.main,
  });
  final String title;
  final String svgIcon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: color,
        child: Transform.scale(scale: 1.2, child: SvgPicture.asset(svgIcon)),
      ),
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.style24w600(
          context,
        ).copyWith(color: AppColors.main, fontFamily: almarai),
      ),
    );
  }
}
