import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/widgets/profile_text_field.dart';

class ShowEmployeeData extends StatelessWidget {
  const ShowEmployeeData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 80,
          child: Image.asset(Assets.imagesTestUserImage),
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
                      controller: TextEditingController(text: 'محمد علي'),
                    ),
                    //البريد الإلكتروني
                    ProfileTextField(
                      title: 'البريد الإلكتروني :',
                      readOnly: true,
                      controller: TextEditingController(text: 'n2n@n2n.com'),
                    ),
                    //رقم التواصل
                    ProfileTextField(
                      title: 'رقم التواصل :',
                      readOnly: true,
                      controller: TextEditingController(text: '0123456789'),
                    ),
                    // الموقع
                    ProfileTextField(
                      title: 'الموقع :',
                      readOnly: true,
                      controller: TextEditingController(
                        text: 'القاهرة - مدينة نصر - شارع 1 - شقة 1',
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
