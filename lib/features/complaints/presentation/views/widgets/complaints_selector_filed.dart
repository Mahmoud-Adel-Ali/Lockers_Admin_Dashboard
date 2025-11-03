import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_popup_menu_button.dart';

class ComplaintsSelectorFiled extends StatelessWidget {
  const ComplaintsSelectorFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      'كل الشكاوي',
      'شكاوي العملاء',
      'شكاوي موظفين الشحن',
      'شكاوي شركات الشحن',
    ];

    return CustomPopupMenuButton<String>(
      items: items,
      initialValue: items.first,
      itemLabelBuilder: (item) => item, // how to display each item
      onSelected: (index) {
        debugPrint('Selected item filter index: $index');
        debugPrint('Selected item: ${items[index]}');
      },
    );
  }
}
