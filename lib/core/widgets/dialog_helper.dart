import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../functions/get_root_context.dart';
import '../utils/app_colors.dart';

abstract class DialogHelper {
  static AwesomeDialog showAwesomeDialog(
    BuildContext context, {
    required String title,
    required String desc,
    DialogType dialogType = DialogType.success,
    AnimType animType = AnimType.rightSlide,
    bool autoDismiss = true,
    bool dismissOnBackKeyPress = true,
    bool dismissOnTouchOutside = true,
    String? btnOkText,
    String? btnCancelText,
    void Function()? btnOkOnPress,
    void Function()? btnCancelOnPress,
    TextStyle? titleStyle,
    TextStyle? descStyle,
    void Function(DismissType)? onDismissCallback,
  }) {
    return AwesomeDialog(
      context: getRootContext(context),
      dialogType: kIsWeb ? DialogType.noHeader : dialogType,
      animType: animType,
      title: title,
      desc: desc,
      autoDismiss: autoDismiss,
      dismissOnBackKeyPress: dismissOnBackKeyPress,
      dismissOnTouchOutside: dismissOnTouchOutside,
      titleTextStyle:
          titleStyle ??
          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      descTextStyle:
          descStyle ??
          const TextStyle(fontSize: 16, color: Colors.black87, height: 1.4),
      btnOkText: btnOkText,
      btnCancelText: btnCancelText,
      btnOkOnPress: btnOkOnPress,
      btnCancelOnPress: btnCancelOnPress,
      btnOkColor: AppColors.green,
      btnCancelColor: AppColors.red,
      onDismissCallback: onDismissCallback,
      width: 500,
    )..show();
  }

  /// ✅ Success Dialog
  static void showSuccessDialog(
    BuildContext context, {
    required String title,
    required String desc,
    String btnOkText = "OK",
    void Function()? onOk,
  }) {
    showAwesomeDialog(
      context,
      title: title,
      desc: desc,
      dialogType: DialogType.success,
      btnOkText: btnOkText,
      btnOkOnPress: onOk,
    );
  }

  /// ❌ Error Dialog
  static void showErrorDialog(
    BuildContext context, {
    required String title,
    required String desc,
    String btnOkText = "Close",
    void Function()? onOk,
  }) {
    showAwesomeDialog(
      context,
      title: title,
      desc: desc,
      dialogType: DialogType.error,
      btnOkText: btnOkText,
      btnOkOnPress: onOk,
    );
  }

  /// ℹ️ Info Dialog
  static void showInfoDialog(
    BuildContext context, {
    required String title,
    required String desc,
    String btnOkText = "Got it",
    void Function()? onOk,
  }) {
    showAwesomeDialog(
      context,
      title: title,
      desc: desc,
      dialogType: DialogType.info,
      btnOkText: btnOkText,
      btnOkOnPress: onOk,
    );
  }

  /// ❓ Question Dialog
  static void showQuestionDialog(
    BuildContext context, {
    required String title,
    required String desc,
    String btnOkText = "Yes",
    String btnCancelText = "No",
    void Function()? onOk,
    void Function()? onCancel,
  }) {
    showAwesomeDialog(
      context,
      title: title,
      desc: desc,
      dialogType: DialogType.question,
      btnOkText: btnOkText,
      btnCancelText: btnCancelText,
      btnOkOnPress: onOk,
      btnCancelOnPress: onCancel,
    );
  }
}
