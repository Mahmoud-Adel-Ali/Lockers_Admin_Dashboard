// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/validation_of_input_fields.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../manager/packages_provider.dart';
import 'edit_package_button.dart';
import 'white_grey_container.dart';

class EditPackageForm extends StatelessWidget {
  const EditPackageForm({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<PackagesProvider>();
    return Form(
      key: prov.formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            const SizedBox(),
            CustomTextFormField(
              hintText: 'إسم الباقة',
              validator: validatorOfUserName,
              keyboardType: TextInputType.name,
              inputFormatters: [
                FilteringTextInputFormatter.singleLineFormatter,
              ],
              controller: prov.name,
            ),
            Row(
              spacing: 8,
              children: [
                Expanded(
                  flex: 5,
                  child: CustomTextFormField(
                    hintText: 'عدد الحجوزات',
                    validator: simpleValidator,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: prov.countLocker,
                  ),
                ),
                Expanded(child: WhiteGreyContainer(text: 'حجز')),
              ],
            ),
            Row(
              spacing: 8,
              children: [
                Expanded(
                  flex: 5,
                  child: CustomTextFormField(
                    hintText: 'سعر الباقة',
                    validator: validatorOfPrice,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,2}'),
                      ),
                    ],
                    controller: prov.price,
                  ),
                ),
                Expanded(child: WhiteGreyContainer(text: 'جنيه')),
              ],
            ),
            Row(
              spacing: 8,
              children: [
                Expanded(
                  flex: 5,
                  child: CustomTextFormField(
                    hintText: 'المدة الزمنية',
                    validator: simpleValidator,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: prov.duration,
                  ),
                ),
                Expanded(child: WhiteGreyContainer(text: 'شهر')),
              ],
            ),

            SizedBox(height: 16),
            EditPackageButton(),
          ],
        ),
      ),
    );
  }
}
