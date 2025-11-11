import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/functions/validation_of_input_fields.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../manager/packages_provider.dart';
import 'white_grey_container.dart';

Future<dynamic> editPackageDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'تعديل بيانات الباقة',
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.7,
        ),
        child: const EditPackageForm(),
      );
    },
  );
}

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
            CustomButton(
              text: 'حفظ',
              onPressed: () {
                if (prov.formKey.currentState!.validate()) {
                  Navigator.pop(context);
                  DialogHelper.showSuccessDialog(
                    context,
                    title: 'تم',
                    desc: 'تم تعديل بيانات الباقة بنجاح',
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
