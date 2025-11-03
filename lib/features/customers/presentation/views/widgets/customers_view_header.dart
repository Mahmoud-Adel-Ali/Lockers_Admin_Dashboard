import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_search_field.dart';
import 'customers_selector_field.dart';

class CustomersViewHeader extends StatelessWidget {
  const CustomersViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isMobile = SizeConfig.isMobile();
    return Row(
      children: [
        Expanded(child: CustomSearchField(hintText: 'ابحث عن عميل')),
        if (!isMobile) const Spacer(flex: 2) else const SizedBox(width: 16),
        CustomersSelectorField(),
      ],
    );
  }
}
