import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/circular_button.dart';

class FilterCustomersButton extends StatelessWidget {
  const FilterCustomersButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      menuPadding: EdgeInsets.only(left: 8, right: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.grey),
      ),
      position: PopupMenuPosition.under,
      color: AppColors.whiteGrey,
      borderRadius: BorderRadius.circular(16),
      elevation: 0.5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      onSelected: (value) {},
      itemBuilder: (context) => [
        const PopupMenuItem<String>(value: 'all', child: Text('الكل')),
        const PopupMenuItem<String>(
          value: 'customer',
          child: Text('عملاء التطبيق'),
        ),
        const PopupMenuItem<String>(
          value: 'company',
          child: Text('شركات الشحن'),
        ),
      ],
      child: CircularButton(
        child: const Icon(Icons.filter_alt_outlined, color: AppColors.main),
      ),
    );
  }
}
