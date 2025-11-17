import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: 2, height: 50, color: AppColors.filedGrey);
  }
}
