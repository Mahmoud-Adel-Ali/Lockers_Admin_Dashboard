import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/utils/app_colors.dart';

class PinputField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onCompleted;
  final bool readOnly;
  final int length;
  final void Function(String)? onChanged;

  const PinputField({
    super.key,
    this.controller,
    this.onCompleted,
    this.readOnly = false,
    this.length = 4,
    this.onChanged,
  });

  static final PinTheme defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 20,
      color: AppColors.main,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.main),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  static final PinTheme focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: AppColors.main),
    borderRadius: BorderRadius.circular(8),
  );

  static final PinTheme submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      color: AppColors.filedGrey,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Pinput(
      readOnly: readOnly,
      controller: controller,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      length: length,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: onCompleted,
      onSubmitted: onCompleted,
      onChanged: onChanged,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (value) {
        if (value == null || value.isEmpty || value.length < length) {
          return "ادخل الرمز بالكامل.";
        }
        return null;
      },
    );
  }
}
