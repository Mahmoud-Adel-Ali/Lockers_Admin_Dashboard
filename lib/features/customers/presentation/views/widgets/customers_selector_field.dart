import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_popup_menu_button.dart';
import '../../../data/enums/customer_type.dart';

class CustomersSelectorField extends StatelessWidget {
  const CustomersSelectorField({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CustomerType> items = [
      CustomerType.all,
      CustomerType.system,
      CustomerType.newCustomers,
      CustomerType.blocked,
    ];

    return CustomPopupMenuButton<CustomerType>(
      items: items,
      initialValue: items.first,
      itemLabelBuilder: (item) => item.arName, // how to display each item
      onSelected: (index) {
        debugPrint('Selected item filter index: $index');
        debugPrint('Selected item: ${items[index]}');
      },
    );
  }
}
