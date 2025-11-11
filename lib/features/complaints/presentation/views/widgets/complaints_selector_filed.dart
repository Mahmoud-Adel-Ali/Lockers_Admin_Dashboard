import 'package:flutter/material.dart';

import '../../../../../core/functions/is_arabic.dart';
import '../../../../../core/widgets/custom_popup_menu_button.dart';
import '../../../data/enums/complaints_type.dart';

class ComplaintsSelectorFiled extends StatelessWidget {
  const ComplaintsSelectorFiled({super.key});

  @override
  Widget build(BuildContext context) {

    final List<ComplaintsType> items = [
      ComplaintsType.all,
      ComplaintsType.user,
      ComplaintsType.company,
      ComplaintsType.employee,
    ];

    return CustomPopupMenuButton<ComplaintsType>(
      items: items,
      initialValue: items.first,
      itemLabelBuilder: (item) => isArabic() ? item.arName : item.enName,
      onSelected: (index) {
        debugPrint('Selected item filter index: $index');
        debugPrint('Selected item: ${items[index]}');
      },
    );
  }
}
