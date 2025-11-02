import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class EmployeesSelectorField extends StatefulWidget {
  const EmployeesSelectorField({super.key});

  @override
  State<EmployeesSelectorField> createState() => _EmployeesSelectorFieldState();
}

class _EmployeesSelectorFieldState extends State<EmployeesSelectorField> {
  // List of menu items
  final List<String> menuItems = [
    'كل الموظفين',
    'إدارة شركات الشحن',
    'إدارة الوحدات',
    'إدارة الحجوزات',
    'إدارة العملاء',
  ];

  // Selected value
  String selectedItem = 'كل الموظفين';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton<String>(
        offset: const Offset(0, 42),
        borderRadius: BorderRadius.circular(16),
        // Items
        onSelected: (value) {
          selectedItem = value;
          setState(() {});
        },
        itemBuilder: (context) => menuItems
            .map(
              (item) => PopupMenuItem<String>(
                value: item,
                child: Text(item, style: AppTextStyles.style16w400(context)),
              ),
            )
            .toList(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.babyBlue,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(selectedItem, style: AppTextStyles.style16w400(context)),
              const SizedBox(width: 4),
              const Icon(Icons.keyboard_arrow_down, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
