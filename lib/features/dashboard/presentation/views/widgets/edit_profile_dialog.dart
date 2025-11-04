// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/snack_bar.dart';
import '../../../../../core/functions/validation_of_input_fields.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/circular_button.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/custom_progress_hub.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../../core/widgets/profile_text_field.dart';
import '../../manager/profile_provider.dart';
import 'profile_password_filed.dart';

Future<dynamic> editProfileDataDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.8,
        ),
        child: EditProfileForm(),
      );
    },
  );
}

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ProfileProvider>();
    return Column(
      children: [
        SizedBox(
          height: 150,
          width: 150,
          child: Stack(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.filedGrey,
                  image: prov.imageFile != null
                      ? DecorationImage(
                          image: FileImage(File(prov.imageFile!.path)),
                          fit: BoxFit.cover,
                        )
                      : customCachedNetworkImageprovider(prov.adminData?.image),
                ),
              ),
              Positioned(
                bottom: 0,
                child: CircularButton(
                  child: Center(
                    child: prov.imageFile != null
                        ? Icon(
                            Icons.clear_sharp,
                            size: 15,
                            color: AppColors.red,
                          )
                        : Icon(Icons.camera_alt_outlined, size: 15),
                  ),
                  onPressed: () {
                    if (prov.imageFile != null) {
                      prov.clearImage();
                    } else {
                      prov.pickFromGallery();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: prov.formKey,
            child: Column(
              spacing: 16,
              children: [
                ProfileTextField(
                  title: 'الإسم :',
                  validator: (value) => validatorOfUserName(value),
                  controller: prov.nameController,
                ),
                ProfileTextField(
                  title: 'الإيميل :',
                  validator: (value) => validatorOfEmail(value),
                  controller: prov.emailController,
                ),
                ProfilePasswordFields(),
                SizedBox(height: 16),
                prov.checkUpdateProfile == null
                    ? LoadingIconWidget()
                    : CustomButton(
                        text: 'حفظ',
                        onPressed: () async {
                          if (prov.formKey.currentState!.validate()) {
                            prov.formKey.currentState!.save();
                            await prov.updateProfile();
                            if (prov.checkUpdateProfile == true) {
                              Navigator.pop(context);
                              showSuccessSnackBar(context, msg: prov.message);
                            } else {
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
          ),
        ),
      ],
    );
  }
}
