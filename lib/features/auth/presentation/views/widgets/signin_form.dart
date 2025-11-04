// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_phone_text_filed.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../../core/widgets/custom_text_password.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../dashboard/presentation/views/admin_dashboard_view.dart';
import '../../manager/auth_provider.dart';
import '../forget_password_view.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({super.key});

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  var formKey = GlobalKey<FormState>();
  // AutovalidateMode autovalidateMode = AutovalidateMode.;

  // controllers
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<AuthProvider>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: 24),
          CustomPhoneTextField(controller: phoneController),
          SizedBox(height: 16),
          CustomPasswordField(controller: passwordController),
          SizedBox(height: 16),
          CustomTextButton(
            title: 'هل نسيت كلمة المرور ؟',
            onTap: () {
              Navigator.pushNamed(context, ForgetPasswordView.routeName);
            },
          ),
          Spacer(),
          CustomButton(
            text: 'تسجيل الدخول',
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                await prov.signin(
                  phone: phoneController.text,
                  password: passwordController.text,
                );

                if (prov.checSingin == true) {
                  Navigator.pushReplacementNamed(
                    context,
                    AdminDashboardView.routeName,
                  );
                } else if (prov.checSingin == false) {
                  DialogHelper.showErrorDialog(
                    context,
                    title: 'خطا',
                    desc: prov.message,
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
