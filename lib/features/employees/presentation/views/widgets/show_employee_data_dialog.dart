import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_labeled_checkbox.dart';
import '../../../../../core/widgets/profile_text_field.dart';
import '../../../data/models/employee_model.dart';
import '../../manager/employees_provider.dart';
import 'edit_employee_data_dialog.dart';

Future<dynamic> showEmployeeDataDialog(
  BuildContext context, {
  required EmployeeModel employee,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.95,
        ),
        leading: CustomButton(
          onPressed: () {
            Navigator.pop(context);
            editEmployeeDataDialog(context, employee: employee);
          },
          horizontal: 0,
          text: 'تعديل البيانات',
        ),
        child: ShowEmployeeDataForm(employee: employee),
      );
    },
  );
}

class ShowEmployeeDataForm extends StatelessWidget {
  const ShowEmployeeDataForm({super.key, required this.employee});
  final EmployeeModel employee;
  @override
  Widget build(BuildContext context) {
    var prov = context.read<EmployeesProvider>();
    return AbsorbPointer(
      absorbing: true,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            Text(
              'بيانات حساب الموظف',
              style: AppTextStyles.style20w500(context),
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: customCachedNetworkImageprovider(employee.image),
              ),
            ),
            const SizedBox(),
            ProfileTextField(title: 'الإسم', controller: prov.name),
            ProfileTextField(title: 'رقم الهاتف', controller: prov.phone),
            ProfileTextField(title: 'الإيميل', controller: prov.email),
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
                    onChanged: (value) {},
                  ),
                  CustomLabeledCheckBox(
                    label: 'إدارة الوحدات',
                    initialValue: prov.manageUnits,
                    onChanged: (value) {},
                  ),
                  CustomLabeledCheckBox(
                    label: 'متابعة الحجوزات',
                    initialValue: prov.followReservations,
                    onChanged: (value) {},
                  ),
                  CustomLabeledCheckBox(
                    label: 'إدارة العملاء',
                    initialValue: prov.manageCustomers,
                    onChanged: (value) {},
                  ),
                  CustomLabeledCheckBox(
                    label: 'إدارة الشكاوي',
                    initialValue: prov.manageComplaints,
                    onChanged: (value) {},
                  ),
                  CustomLabeledCheckBox(
                    label: 'إدارة قسم الصيانة',
                    initialValue: prov.manageMaintenance,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
