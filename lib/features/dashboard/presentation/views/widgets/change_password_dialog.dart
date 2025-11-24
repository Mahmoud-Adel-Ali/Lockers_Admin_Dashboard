// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/check_unauthenticated.dart';
import '../../../../../core/functions/snack_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/custom_progress_hub.dart';
import '../../../../../core/widgets/custom_text_password.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/profile_provider.dart';

Future<void> changePasswordDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return CustomDialog(
        title: 'تعديل كلمة المرور',
        message: '',
        constraints: const BoxConstraints(maxHeight: 420, maxWidth: 500),
        child: ChangePasswordForm(),
      );
    },
  );
}

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  var formKey = GlobalKey<FormState>();
  var currentPassword = TextEditingController();
  var password = TextEditingController();
  var passwordConfirmation = TextEditingController();

  @override
  void dispose() {
    currentPassword.dispose();
    password.dispose();
    passwordConfirmation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ProfileProvider>();
    return Form(
      key: formKey,
      child: Column(
        spacing: 16,
        children: [
          SizedBox(height: 16),
          CustomPasswordField(
            hintText: 'كلمة المرور الحالية',
            controller: currentPassword,
          ),
          CustomPasswordField(
            hintText: 'كلمة المرور الجديدة',
            controller: password,
          ),
          CustomPasswordField(
            hintText: 'تاكيد كلمة المرور الجديدة',
            controller: passwordConfirmation,
          ),
          SizedBox(height: 42),
          (prov.checkChangingPassword == null)
              ? LoadingIconWidget()
              : CustomButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      await prov.changePassword(
                        currentPassword: currentPassword.text,
                        password: password.text,
                        passwordConfirmation: passwordConfirmation.text,
                      );
                      if (prov.checkChangingPassword == true) {
                        Navigator.pop(context);
                        showSuccessSnackBar(
                          context,
                          msg: prov.checkChangingPasswordMessage,
                        );
                      } else {
                        checkUnauthenticated(
                          context,
                          msg: prov.checkChangingPasswordMessage,
                        );
                        DialogHelper.showErrorDialog(
                          context,
                          title: S.of(context).error,
                          desc: prov.checkChangingPasswordMessage,
                        );
                      }
                    }
                  },
                  text: 'حفظ التغيرات',
                ),
        ],
      ),
    );
  }
}
