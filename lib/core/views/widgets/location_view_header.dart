import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../widgets/arrow_back_icon.dart';

class LocationViewHeader extends StatelessWidget {
  const LocationViewHeader({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        ArrowBackIcon(),
        Text(
          title,
          style: AppTextStyles.style24w400(
            context,
          ).copyWith(color: AppColors.main, fontFamily: vexaLight),
        ),
      ],
    );
  }
}
