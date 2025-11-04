import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'custom_text_form_field.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    super.key,
    this.title,
    this.readOnly = false,
    this.onTap,
    this.validator,
    this.controller,
    this.suffixIcon,
  });
  final String? title;
  final bool readOnly;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CustomTextFormField(
        hintText: '',
        prefixIcon: title == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 10.0,
                ),
                child: Text(
                  title!,
                  style: AppTextStyles.style14w400(
                    context,
                  ).copyWith(color: AppColors.black),
                ),
              ),
        readOnly: readOnly,
        controller: controller,
        validator: validator,
        color: AppColors.filedGrey,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
