import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    this.hintText = 'البحث',
    this.onChanged,
    this.controller,
  });
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(),
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {},
      onChanged: (value) {},
      cursorColor: AppColors.main,
      style: AppTextStyles.style20w500(context).copyWith(color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.search, color: Colors.black54),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: AppColors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: AppColors.main, width: 1.2),
        ),
      ),
    );
  }
}
