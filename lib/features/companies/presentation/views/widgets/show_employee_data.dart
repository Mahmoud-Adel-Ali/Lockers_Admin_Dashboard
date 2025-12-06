import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_info_field.dart';
import '../../../data/models/company_employee_model.dart';

class ShowEmployeeData extends StatelessWidget {
  const ShowEmployeeData({super.key, required this.employee});
  final CompanyEmployeeModel employee;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.grey, width: 1.5),
            image: customCachedNetworkImageprovider(employee.image),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            spacing: 16,
            children: [
              AbsorbPointer(
                child: Column(
                  spacing: 16,
                  children: [
                    //الإسم
                    CustomInfoField(title: 'الإسم :', info: employee.name),
                    //رقم التواصل
                    CustomInfoField(
                      title: 'رقم التواصل :',
                      info: employee.phone,
                    ),
                    // الموقع
                    // ProfileTextField(
                    //   title: 'الموقع :',
                    //   readOnly: true,
                    //   controller: TextEditingController(
                    //     text: convertLocationToText(
                    //       context,
                    //       city: employee.city,
                    //       neighborhood: employee.neighborhood,
                    //       street: employee.street,
                    //       buildingNum: employee.buildNumber,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
