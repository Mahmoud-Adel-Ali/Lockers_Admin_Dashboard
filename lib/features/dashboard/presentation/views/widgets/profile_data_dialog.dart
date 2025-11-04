import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/profile_text_field.dart';
import '../../manager/profile_provider.dart';
import 'edit_profile_dialog.dart';
import 'profile_password_filed.dart';

Future<dynamic> profileDataDialog(BuildContext context) {
  var prov = context.read<ProfileProvider>();
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.9,
        ),
        leading: CustomButton(
          text: 'تعديل البيانات',
          horizontal: 0,
          onPressed: () => editProfileDataDialog(context),
        ),
        child: Column(
          children: [
            Text('بيانات الحساب', style: AppTextStyles.style18w400(context)),
            const SizedBox(height: 16),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: customCachedNetworkImageprovider(prov.adminData?.image),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 16,
                children: [
                  AbsorbPointer(
                    child: Column(
                      spacing: 16,
                      children: [
                        ProfileTextField(
                          title: 'الإسم :',
                          controller: prov.nameController,
                        ),
                        ProfileTextField(
                          title: 'الإيميل :',
                          controller: prov.emailController,
                        ),
                        ProfileTextField(
                          title: 'رقم الهاتف :',
                          controller: TextEditingController(
                            text: prov.adminData?.phone ?? '',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const ProfilePasswordFields(),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
