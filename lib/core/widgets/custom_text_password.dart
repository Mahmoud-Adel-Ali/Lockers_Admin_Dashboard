import 'package:flutter/material.dart';

import '../functions/validation_of_input_fields.dart';
import '../utils/app_colors.dart';
import 'custom_text_form_field.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    this.hintText = 'كلمه المرور',
    this.controller,
  });
  final String hintText;
  final TextEditingController? controller;
  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  late bool obscureText = true, validPassword = false;

  void setObscure(bool obscure) => setState(() {
    obscureText = obscure;
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: widget.hintText,
      controller: widget.controller,
      obscureText: obscureText,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) => validatorOfPassword(value),
      onChanged: (value) {
        validPassword = validatorOfPasswordBool(value);
        setState(() {});
      },
      suffixIcon: IconButton(
        onPressed: () => setObscure(!obscureText),
        icon: obscureText
            ? Icon(
                Icons.visibility_off_sharp,
                color: validPassword ? AppColors.main : AppColors.grey,
              )
            : Icon(
                Icons.visibility,
                color: validPassword ? AppColors.main : AppColors.grey,
              ),
      ),
    );
  }
}
