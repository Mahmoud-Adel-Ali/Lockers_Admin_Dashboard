import 'package:flutter/material.dart';

import 'company_subscribtion_body.dart';
import 'company_subscribtion_header.dart';

class CompanySubscribtionSection extends StatelessWidget {
  const CompanySubscribtionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CompanySubscribtionHeader(),
        SizedBox(height: 8),
        CompanySubscribtionBody(),
      ],
    );
  }
}
