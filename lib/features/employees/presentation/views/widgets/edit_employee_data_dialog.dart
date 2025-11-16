// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/functions/check_unauthenticated.dart';
import '../../../../../core/functions/show_loading_dialog.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_labeled_checkbox.dart';
import '../../../../../core/widgets/custom_phone_text_filed.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/employee_model.dart';
import '../../manager/employees_provider.dart';

Future<dynamic> editEmployeeDataDialog(
  BuildContext context, {
  required EmployeeModel employee,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'تعديل صلاحيات الموظف',
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.95,
        ),
        child: EditEmployeeDataForm(employee: employee),
      );
    },
  );
}

class EditEmployeeDataForm extends StatelessWidget {
  const EditEmployeeDataForm({super.key, required this.employee});
  final EmployeeModel employee;

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<EmployeesProvider>();
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: customCachedNetworkImageprovider(employee.image),
              ),
            ),
            const SizedBox(),
            AbsorbPointer(
              absorbing: true,
              child: Column(
                spacing: 16,
                children: [
                  CustomTextFormField(lable: 'الإسم', controller: prov.name),
                  CustomPhoneTextField(
                    label: 'رقم الهاتف',
                    controller: prov.phone,
                  ),
                  CustomTextFormField(lable: 'الإيميل', controller: prov.email),
                ],
              ),
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
              text: 'تعديل',
              onPressed: () async {
                //* Show Loading Dialog
                showLoadingDialog(context);

                await prov.updateEmployee(id: employee.id);

                //* Close Loading Dialog
                Navigator.pop(context);

                if (prov.checkUpdateEmployee == true) {
                  Navigator.pop(context);
                } else if (prov.checkUpdateEmployee == false) {
                  checkUnauthenticated(context, msg: prov.message);
                  DialogHelper.showErrorDialog(
                    context,
                    title: S.of(context).error,
                    desc: prov.message,
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
