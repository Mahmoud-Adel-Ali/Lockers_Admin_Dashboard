import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/filter_button.dart';

class AddUnitButton extends StatelessWidget {
  const AddUnitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: FilterButton(
          title: 'إضافة وحدة',
          activeIcon: Assets.imagesAddIcon,
          inactiveIcon: Assets.imagesAddIcon,
          isSelected: false,
          // onTap: () => addNewCompanyDialog(context),
        ),
      ),
    );
  }
}
