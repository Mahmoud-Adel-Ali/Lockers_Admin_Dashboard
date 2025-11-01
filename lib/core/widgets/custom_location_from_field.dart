import 'package:flutter/material.dart';

import '../utils/assets.dart';
import 'custom_text_form_field.dart';

class CustomLocationFormFied extends StatelessWidget {
  const CustomLocationFormFied({
    super.key,
    this.hintText = 'الموقع',
    this.controller,
    this.onTap,
  });
  final String hintText;
  final TextEditingController? controller;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AbsorbPointer(
        absorbing: true,
        child: CustomTextFormField(
          hintText: hintText,
          readOnly: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'الموقع مطلوب';
            }
            return null;
          },
          controller: controller,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(Assets.imagesGoogleMap, width: 10, height: 10),
          ),
        ),
      ),
    );
  }
}
