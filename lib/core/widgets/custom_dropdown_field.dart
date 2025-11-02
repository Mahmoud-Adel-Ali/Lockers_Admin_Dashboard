import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomDropdownTextField extends StatelessWidget {
  const CustomDropdownTextField({
    super.key,
    required this.items,
    this.onSelected,
    this.value,
    this.hintText,
    this.validator,
    this.controller,
    this.selectedTrailingIcon,
    this.onChanged,
  });

  final List<String> items;
  final String? value;
  final String? hintText;
  final String? Function(String?)? validator;
  final ValueChanged<int?>? onSelected;
  final TextEditingController? controller;
  final Widget? selectedTrailingIcon;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    if (controller != null && onChanged != null) {
      controller!.addListener(() {
        onChanged!(controller!.text);
      });
    }
    return DropdownMenu<int>(
      enableFilter: true,
      requestFocusOnTap: true,
      selectedTrailingIcon: selectedTrailingIcon,
      textStyle: AppTextStyles.style20w700(context),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppTextStyles.style16w400(context),
        fillColor: AppColors.filedGrey,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.filedGrey),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.filedGrey),
        ),
      ),
      controller: controller,
      onSelected: onSelected,
      hintText: hintText,
      expandedInsets: EdgeInsets.zero,
      dropdownMenuEntries: List.generate(
        items.length,
        (index) => DropdownMenuEntry<int>(
          label: items[index],
          value: index,
          style: ButtonStyle(
            padding: const WidgetStatePropertyAll(EdgeInsets.zero),
            textStyle: WidgetStatePropertyAll(
              AppTextStyles.style20w400(context),
            ),
            shadowColor: const WidgetStatePropertyAll(AppColors.white),
            overlayColor: const WidgetStatePropertyAll(AppColors.white),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ),
      ),
    );
  }
}
