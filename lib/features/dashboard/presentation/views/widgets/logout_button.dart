import 'package:flutter/material.dart';

import '../../../../../core/services/hive_services.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../auth/presentation/views/signin_view.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'تسجيل الخروج',
              color: AppColors.phosphorGreen,
              onPressed: () {
                DialogHelper.showQuestionDialog(
                  context,
                  title: 'تسجيل الخروج',
                  desc: 'هل ترغب في تسجيل الخروج من التطبيق؟',
                  btnOkText: 'نعم',
                  onOk: () {
                    HiveServices.clearAdminData();
                    HiveServices.setAdminLoggedOut();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      SigninView.routeName,
                      (_) => false,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
