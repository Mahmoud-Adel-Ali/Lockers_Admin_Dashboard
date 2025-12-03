// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/functions/check_unauthenticated.dart';
import '../../../../../core/functions/show_loading_dialog.dart';
import '../../../../../core/functions/validation_of_input_fields.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_labeled_checkbox.dart';
import '../../../../../core/widgets/custom_phone_text_filed.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/custom_text_password.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../../generated/l10n.dart';
import '../../../../home/presentation/manager/home_provider.dart';
import '../../manager/employees_provider.dart';
import 'add_new_employee_image.dart';

Future<dynamic> addNewEmployeeDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'إضافة موظف جديد',
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 700),
        child: const AddEmployeeeDataForm(),
      );
    },
  );
}

class AddEmployeeeDataForm extends StatelessWidget {
  const AddEmployeeeDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<EmployeesProvider>();
    return Form(
      key: prov.formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            AddNewEmployeeImage(),
            const SizedBox(),
            CustomTextFormField(
              hintText: 'الإسم',
              validator: validatorOfUserName,
              controller: prov.name,
            ),
            CustomPhoneTextField(controller: prov.phone),
            CustomTextFormField(
              hintText: 'الإيميل',
              controller: prov.email,
              validator: validatorOfEmail,
            ),
            CustomPasswordField(
              hintText: 'كلمة المرور',
              controller: prov.password,
            ),
            CustomPasswordField(
              hintText: 'تاكيد كلمة المرور',
              controller: prov.passwordConfirmation,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColors.filedGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'الدور الوظيفي',
                        style: AppTextStyles.style16w400(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  CustomLabeledCheckBox(
                    label: 'إدارة شركات الشحن',
                    initialValue: prov.manageShippingCompanies,
                    onChanged: (value) {
                      prov.changePermissions(manageShippingCompanies: value);
                    },
                  ),
                  CustomLabeledCheckBox(
                    label: 'إدارة الوحدات',
                    initialValue: prov.manageUnits,
                    onChanged: (value) {
                      prov.changePermissions(manageUnits: value);
                    },
                  ),
                  CustomLabeledCheckBox(
                    label: 'متابعة الحجوزات',
                    initialValue: prov.followReservations,
                    onChanged: (value) {
                      prov.changePermissions(followReservations: value);
                    },
                  ),
                  CustomLabeledCheckBox(
                    label: 'إدارة العملاء',
                    initialValue: prov.manageCustomers,
                    onChanged: (value) {
                      prov.changePermissions(manageCustomers: value);
                    },
                  ),
                  CustomLabeledCheckBox(
                    label: 'إدارة الشكاوي',
                    initialValue: prov.manageComplaints,
                    onChanged: (value) {
                      prov.changePermissions(manageComplaints: value);
                    },
                  ),
                  CustomLabeledCheckBox(
                    label: 'إدارة قسم الصيانة',
                    initialValue: prov.manageMaintenance,
                    onChanged: (value) {
                      prov.changePermissions(manageMaintenance: value);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'إضافة',
              onPressed: () async {
                if (prov.formKey.currentState!.validate()) {
                  //* Show Loading Dialog
                  showLoadingDialog(context);

                  await prov.addNewEmployee();

                  //* Close Loading Dialog
                  Navigator.pop(context);

                  if (prov.checkAddEmployee == true) {
                    //* Close Dialog
                    Navigator.pop(context);

                    //* Get Home Dashboard Data
                    context.read<HomeProvider>().getHomeDashboardData();
                  } else if (prov.checkAddEmployee == false) {
                    checkUnauthenticated(context, msg: prov.message);
                    DialogHelper.showErrorDialog(
                      context,
                      title: S.of(context).error,
                      desc: prov.message,
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
