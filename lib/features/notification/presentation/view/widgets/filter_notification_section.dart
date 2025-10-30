import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/widgets/custom_button.dart';

class FilterNotificationSection extends StatefulWidget {
  const FilterNotificationSection({super.key});

  @override
  State<FilterNotificationSection> createState() =>
      _FilterNotificationSectionState();
}

class _FilterNotificationSectionState extends State<FilterNotificationSection> {
  bool showAll = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        CustomButton(
          onPressed: () {
            showAll = false;
            setState(() {});
          },
          text: 'الغير مقرؤة',
          color: showAll ? AppColors.phosphorGreen : AppColors.main,
          horizontal: 0,
        ),
        SizedBox(width: 8),
        CustomButton(
          onPressed: () {
            showAll = true;
            setState(() {});
          },
          text: 'الكل',
          color: showAll ? AppColors.main : AppColors.phosphorGreen,
          horizontal: 0,
        ),
      ],
    );
  }
}
