import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_popup_menu_button.dart';

class FilterCustomersButton extends StatelessWidget {
  const FilterCustomersButton({super.key});

  @override
  Widget build(BuildContext context) {
    // List of filter options
    final items = ['الكل', 'عملاء التطبيق', 'شركات الشحن'];

    return CustomPopupMenuButton<String>(
      key: const Key('filter_button'),
      items: items,
      initialValue: items.first,
      itemLabelBuilder: (item) => item,
      backgroundColor: AppColors.whiteGrey,
      textStyle: AppTextStyles.style16w400(context),
      onSelected: (index) {
        debugPrint('Selected customer filter index: $index');
        debugPrint('Selected filter: ${items[index]}');
      },
    );
  }
}
