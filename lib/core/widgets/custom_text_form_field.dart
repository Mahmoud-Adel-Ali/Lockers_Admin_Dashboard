import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText = '',
    this.controller,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.color = AppColors.filedGrey,
    this.colorText = AppColors.grey,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.lines = 1,
    this.lable,
    this.readOnly = false,
    this.enabled = true,
    this.radius = 20,
    this.keyboardType,
    this.onChanged,
  });

  final String hintText;
  final String? lable;
  final double radius;
  final int lines;
  final Color color, colorText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool obscureText, readOnly, enabled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final AutovalidateMode autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      maxLines: lines,
      controller: controller,
      validator: validator,
      autovalidateMode: autovalidateMode,
      onChanged: onChanged,
      obscureText: obscureText,
      readOnly: readOnly,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: color,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        label: lable != null
            ? Text(lable!, style: AppTextStyles.style16w700(context))
            : null,
        hint: Text(
          hintText,
          style: AppTextStyles.style12w400(context).copyWith(color: colorText),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
