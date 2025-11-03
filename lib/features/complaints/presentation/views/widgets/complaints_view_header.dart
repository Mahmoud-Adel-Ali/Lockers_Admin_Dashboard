import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/widgets/custom_search_field.dart';

import '../../../../../core/utils/size_config.dart';
import 'complaints_selector_filed.dart';

class ComplaintsViewHeader extends StatelessWidget {
  const ComplaintsViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isMobile = SizeConfig.isMobile();
    return Row(
      children: [
        Expanded(child: CustomSearchField()),
        if (!isMobile) const Spacer(flex: 2) else SizedBox(width: 16),
        ComplaintsSelectorFiled(),
      ],
    );
  }
}
