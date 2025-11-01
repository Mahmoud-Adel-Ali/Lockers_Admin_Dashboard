import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/filter_button.dart';

class AddCompanyButton extends StatelessWidget {
  const AddCompanyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: FilterButton(
          title: 'إضافة شركه',
          activeIcon: Assets.imagesAddIcon,
          inactiveIcon: Assets.imagesAddIcon,
          isSelected: false,
        ),
      ),
    );
  }
}
