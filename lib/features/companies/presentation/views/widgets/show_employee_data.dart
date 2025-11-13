import 'package:flutter/material.dart';

import '../../../../../../core/widgets/profile_text_field.dart';
import '../../../../../core/functions/convert_location_to_text.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
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
                    ProfileTextField(
                      title: 'الإسم :',
                      readOnly: true,
                      controller: TextEditingController(text: employee.name),
                    ),
                    //البريد الإلكتروني
                    // ProfileTextField(
                    //   title: 'البريد الإلكتروني :',
                    //   readOnly: true,
                    //   controller: TextEditingController(text: employee.email),
                    // ),
                    //رقم التواصل
                    ProfileTextField(
                      title: 'رقم التواصل :',
                      readOnly: true,
                      controller: TextEditingController(text: employee.phone),
                    ),
                    // الموقع
                    ProfileTextField(
                      title: 'الموقع :',
                      readOnly: true,
                      controller: TextEditingController(
                        text: convertLocationToText(
                          context,
                          city: employee.city,
                          neighborhood: employee.neighborhood,
                          street: employee.street,
                          buildingNum: employee.buildNumber,
                        ),
                      ),
                    ),
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
