import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/validation_of_input_fields.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../manager/packages_provider.dart';
import 'add_new_package_dialog_button.dart';
import 'white_grey_container.dart';

class AddNewPackageForm extends StatelessWidget {
  const AddNewPackageForm({super.key});

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
              lable: 'إسم الباقة',
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
                  flex: 4,
                  child: CustomTextFormField(
                    lable: 'عدد الحجوزات',
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
                  flex: 4,
                  child: CustomTextFormField(
                    lable: 'سعر الباقة',
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
                  flex: 4,
                  child: CustomTextFormField(
                    lable: 'المدة الزمنية',
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
            AddNewPackageDialogButton(),
          ],
        ),
      ),
    );
  }
}
