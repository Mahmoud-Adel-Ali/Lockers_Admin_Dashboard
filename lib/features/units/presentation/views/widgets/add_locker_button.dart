import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/filter_button.dart';

class AddLockerButton extends StatelessWidget {
  const AddLockerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilterButton(
      title: 'إضافة خزينه',
      activeIcon: Assets.imagesAddIcon,
      inactiveIcon: Assets.imagesAddIcon,
      isSelected: false,
      onTap: () {},
    );
  }
}
