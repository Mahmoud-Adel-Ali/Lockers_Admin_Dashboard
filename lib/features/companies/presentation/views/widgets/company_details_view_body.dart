import 'package:flutter/material.dart';

import 'company_basic_info_section.dart';

class CompanyDetailsViewBody extends StatelessWidget {
  const CompanyDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: SingleChildScrollView(child: CompanyBasicInfoSection()),
        ),
        Expanded(flex: 2, child: SizedBox()),
      ],
    );
  }
}
