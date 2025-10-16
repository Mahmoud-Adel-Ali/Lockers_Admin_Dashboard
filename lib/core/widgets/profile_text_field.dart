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
  final String Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          color: AppColors.filedGrey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  title!,
                  style: AppTextStyles.style16w500(
                    context,
                  ).copyWith(color: AppColors.black2),
                ),
              ),
            SizedBox(width: title != null ? 16 : 0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: CustomTextFormField(
                  hintText: '',
                  readOnly: readOnly,
                  controller: controller,
                  validator: validator,
                  color: AppColors.filedGrey,
                  suffixIcon: suffixIcon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
