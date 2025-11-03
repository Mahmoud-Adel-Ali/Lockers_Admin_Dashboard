import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_popup_menu_button.dart';

class EmployeesSelectorField extends StatelessWidget {
  const EmployeesSelectorField({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      'كل الموظفين',
      'إدارة شركات الشحن',
      'إدارة الوحدات',
      'إدارة الحجوزات',
      'إدارة العملاء',
    ];

    return CustomPopupMenuButton<String>(
      items: items,
      initialValue: items.first,
      itemLabelBuilder: (item) => item, // how to display each item
      onSelected: (index) {
        debugPrint('Selected employee filter index: $index');
        debugPrint('Selected item: ${items[index]}');
      },
    );
  }
}
