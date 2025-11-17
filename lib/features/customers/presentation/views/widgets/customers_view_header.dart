import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_search_field.dart';
import '../../manager/customers_provider.dart';
import 'customers_selector_field.dart';

class CustomersViewHeader extends StatelessWidget {
  const CustomersViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isMobile = SizeConfig.isMobile();
    return Row(
      children: [
        Expanded(child: CustomersSearchField()),
        if (!isMobile) const Spacer(flex: 2) else const SizedBox(width: 16),
        CustomersSelectorField(),
      ],
    );
  }
}

class CustomersSearchField extends StatelessWidget {
  const CustomersSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<CustomersProvider>();
    return CustomSearchField(
      hintText: 'ابحث عن عميل',
      controller: prov.searchController,
      onChanged: (val) {
        if (prov.checkGetAllCustomers == null) return;
        prov.getAllCustomers();
      },
    );
  }
}
