import 'package:flutter/material.dart';

import 'company_details_button.dart';
import 'company_subscribtion_body.dart';
import 'company_subscribtion_header.dart';

class CompanySubscribtionSection extends StatelessWidget {
  const CompanySubscribtionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        const CompanySubscribtionHeader(),
        const CompanySubscribtionBody(),
        Row(children: [Expanded(child: CompanyDetailsButton())]),
        const SizedBox(),
      ],
    );
  }
}
