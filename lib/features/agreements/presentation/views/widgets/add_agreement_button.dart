import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/filter_button.dart';
import 'add_new_agreement_dialog.dart';

class AddAgreementButton extends StatelessWidget {
  const AddAgreementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 222,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: FilterButton(
          title: 'إضافة باقة جديدة',
          activeIcon: Assets.imagesAddIcon,
          inactiveIcon: Assets.imagesAddIcon,
          isSelected: false,
          onTap: () => addNewAgreementDialog(context),
        ),
      ),
    );
  }
}
