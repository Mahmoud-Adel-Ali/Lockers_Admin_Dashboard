import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/filter_button.dart';
import '../../manager/packages_provider.dart';
import 'add_new_package_dialog.dart';

class AddNewPackageButton extends StatelessWidget {
  const AddNewPackageButton({super.key});

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
          onTap: () {
            context.read<PackagesProvider>().clearControllers();
            addNewPackageDialog(context);
          },
        ),
      ),
    );
  }
}
