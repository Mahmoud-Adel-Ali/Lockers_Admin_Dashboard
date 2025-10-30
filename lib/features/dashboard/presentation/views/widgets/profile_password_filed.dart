import 'package:flutter/material.dart';

import '../../../../../core/widgets/profile_text_field.dart';
import 'change_password_dialog.dart';

class ProfilePasswordFields extends StatelessWidget {
  const ProfilePasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        InkWell(
          onTap: () => changePasswordDialog(context),
          child: AbsorbPointer(
            child: ProfileTextField(
              title: 'كلمة المرور :',
              readOnly: true,
              controller: TextEditingController(text: '**********'),
            ),
          ),
        ),
      ],
    );
  }
}
