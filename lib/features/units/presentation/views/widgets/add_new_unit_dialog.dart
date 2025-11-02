import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_location_from_field.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../companies/presentation/views/pick_company_location_view.dart';

Future<dynamic> addNewUnitDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'إضافة وحدة جديدة',
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.5,
        ),
        child: const AddNewUnitForm(),
      );
    },
  );
}

class AddNewUnitForm extends StatelessWidget {
  const AddNewUnitForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            const SizedBox(),
            CustomTextFormField(hintText: 'رقم الوحدة'),
            CustomLocationFormFied(
              hintText: 'موقع الشركة',
              onTap: () {
                Navigator.of(
                  context,
                ).pushNamed(PickCompanyLocationView.routeName);
              },
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'إضافة',
              onPressed: () {
                Navigator.pop(context);
                DialogHelper.showSuccessDialog(
                  context,
                  title: 'تم',
                  desc: 'تم اضافة الوحدة بنجاح',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
