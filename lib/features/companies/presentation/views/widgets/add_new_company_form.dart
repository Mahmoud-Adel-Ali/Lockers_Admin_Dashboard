// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../core/widgets/custom_text_password.dart';
import '../../../../../core/functions/convert_location_to_text.dart';
import '../../../../../core/functions/validation_of_input_fields.dart';
import '../../../../../core/models/location_details_model.dart';
import '../../../../../core/views/pick_location_view.dart';
import '../../../../../core/widgets/custom_location_from_field.dart';
import '../../../../../core/widgets/custom_phone_text_filed.dart';
import '../../manager/companies_provider.dart';
import 'add_new_company_form_button.dart';
import 'add_new_company_image.dart';

class AddNewCompanyForm extends StatelessWidget {
  const AddNewCompanyForm({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<CompaniesProvider>();
    return Form(
      key: prov.formKey,
      child: Column(
        children: [
          AddNewCompanyImageSection(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 16,
              children: [
                CustomTextFormField(
                  hintText: 'إسم الشركة',
                  controller: prov.nameController,
                  validator: validatorOfUserName,
                ),
                CustomTextFormField(
                  hintText: 'إسم مسؤول الإدارة',
                  controller: prov.adminNameController,
                  validator: validatorOfUserName,
                ),
                CustomTextFormField(
                  hintText: 'البريد الالكتروني',
                  controller: prov.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: validatorOfEmail,
                ),
                CustomPhoneTextField(controller: prov.phoneController),
                CustomPasswordField(
                  hintText: 'كلمة المرور',
                  controller: prov.passwordController,
                ),
                CustomPasswordField(
                  hintText: 'تاكيد كلمة المرور',
                  controller: prov.passwordConfirmationController,
                ),
                CustomLocationFormFied(
                  hintText: 'موقع الشركة',
                  controller: prov.locationDetailsModel == null
                      ? null
                      : TextEditingController(
                          text: convertLocationToText(
                            context,
                            city: prov.locationDetailsModel!.city,
                            neighborhood:
                                prov.locationDetailsModel!.neighborhood,
                            street: prov.locationDetailsModel!.street,
                            buildingNum: prov.locationDetailsModel!.buildingNum,
                          ),
                        ),
                  onTap: () async {
                    final location = await Navigator.push<LocationDetailsModel>(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PickLocationView(),
                      ),
                    );

                    if (location != null) {
                      prov.onPickLocation(location);
                      log('City: ${location.toString()}');
                    }
                  },
                ),
                SizedBox(height: 8),
                AddNewCompanyFormButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
