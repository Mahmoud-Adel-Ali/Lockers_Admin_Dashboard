import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/custom_info_field.dart';
import '../../manager/profile_provider.dart';
import 'edit_profile_dialog.dart';
import 'profile_password_filed.dart';

Future<dynamic> profileDataDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        constraints: BoxConstraints(maxWidth: 500, maxHeight: 575),
        leading: CustomButton(
          text: 'تعديل البيانات',
          horizontal: 0,
          onPressed: () => editProfileDataDialog(context),
        ),
        child: ProfileDataForm(),
      );
    },
  );
}

class ProfileDataForm extends StatelessWidget {
  const ProfileDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ProfileProvider>();
    return Column(
      children: [
        Text('بيانات الحساب', style: AppTextStyles.style18w400(context)),
        const SizedBox(height: 16),
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.grey, width: 1),
            image: customCachedNetworkImageprovider(prov.adminData?.image),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            children: [
              CustomInfoField(title: 'الإسم :', info: prov.nameController.text),
              CustomInfoField(
                title: 'الإيميل :',
                info: prov.emailController.text,
              ),
              CustomInfoField(
                title: 'رقم الهاتف :',
                info: prov.adminData?.phone ?? '',
              ),
              const AbsorbPointer(child: ProfilePasswordFields()),
            ],
          ),
        ),
      ],
    );
  }
}
