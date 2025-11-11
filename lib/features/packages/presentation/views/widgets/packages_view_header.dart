import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/widgets/custom_search_field.dart';

import '../../../../../core/utils/size_config.dart';
import 'add_new_package_button.dart';

class PackagesViewHeader extends StatelessWidget {
  const PackagesViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isMobile = SizeConfig.isMobile();
    return Row(
      children: [
        Expanded(flex: 2, child: CustomSearchField()),
        if (!isMobile) const Spacer(flex: 3),
        if (!isMobile) AddNewPackageButton(),
      ],
    );
  }
}
