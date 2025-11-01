import 'package:flutter/material.dart';

import 'widgets/company_details_view_body.dart';
import 'widgets/company_details_view_header.dart';

class CompanyDetailsView extends StatelessWidget {
  const CompanyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        CompanyDetailsViewHeader(),
        SizedBox(height: 8),
        Expanded(child: CompanyDetailsViewBody()),
        SizedBox(height: 8),
      ],
    );
  }
}
