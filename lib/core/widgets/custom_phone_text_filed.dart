import 'package:flutter/material.dart';

import '../functions/validation_of_input_fields.dart';
import '../utils/app_colors.dart';
import 'custom_text_form_field.dart';

class CustomPhoneTextField extends StatefulWidget {
  const CustomPhoneTextField({
    super.key,
    this.hintText = 'رقم الهاتف',
    this.controller,
  });
  final String hintText;
  final TextEditingController? controller;
  @override
  State<CustomPhoneTextField> createState() => _CustomPhoneTextFieldState();
}

class _CustomPhoneTextFieldState extends State<CustomPhoneTextField> {
  bool validPhone = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: widget.hintText,
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      suffixIcon: Icon(
        Icons.phone,
        color: validPhone ? AppColors.main : AppColors.grey,
      ),
      validator: (value) => validatorOfEgyptianPhone(value),
      onChanged: (value) {
        validPhone = validatorOfEgyptianPhoneBool(value);
        setState(() {});
      },
    );
  }
}
