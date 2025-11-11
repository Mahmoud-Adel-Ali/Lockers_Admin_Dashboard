import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/is_arabic.dart';
import '../../../../../core/widgets/custom_popup_menu_button.dart';
import '../../../data/enums/complaints_type.dart';
import '../../manager/complaints_provider.dart';

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

    var read = context.watch<ComplaintsProvider>();
    return CustomPopupMenuButton<ComplaintsType>(
      items: items,
      initialValue: read.complaintsType,
      itemLabelBuilder: (item) => isArabic() ? item.arName : item.enName,
      onSelected: (index) {
        read.onChangeComplaintsType(items[index]);
      },
    );
  }
}
