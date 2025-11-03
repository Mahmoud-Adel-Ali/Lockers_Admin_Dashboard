import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_popup_menu_button.dart';

class CustomersSelectorField extends StatelessWidget {
  const CustomersSelectorField({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      " جميع العملاء",
      "عملاء النظام",
      "العملاء الجدد",
      "العملاء المحظورين",
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
