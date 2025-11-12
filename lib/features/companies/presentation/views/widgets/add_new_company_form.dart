import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/utils/app_colors.dart';

import '../../../../../../core/widgets/circular_button.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../core/widgets/custom_text_password.dart';
import '../../../../../core/widgets/custom_location_from_field.dart';
import '../../../../../core/widgets/custom_phone_text_filed.dart';
import '../../../../../core/views/pick_location_view.dart';

class AddNewCompanyForm extends StatelessWidget {
  const AddNewCompanyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Stack(
              children: [
                CircleAvatar(radius: 100, backgroundColor: AppColors.whiteGrey),
                Positioned(
                  bottom: 10,
                  right: 15,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularButton(
                      child: Center(
                        child: Icon(Icons.camera_alt_outlined, size: 15),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 16,
              children: [
                CustomTextFormField(hintText: 'إسم الشركة'),
                CustomTextFormField(hintText: 'إسم مسؤول الإدارة'),
                CustomTextFormField(hintText: 'البريد الالكتروني'),
                CustomPhoneTextField(),
                CustomPasswordField(hintText: 'كلمة المرور'),
                CustomLocationFormFied(
                  hintText: 'موقع الشركة',
                  onTap: () {
                    Navigator.of(context).pushNamed(PickLocationView.routeName);
                  },
                ),
                SizedBox(height: 8),
                CustomButton(text: 'إضافة', onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
