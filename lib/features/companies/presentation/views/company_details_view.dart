import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/api_error_widget.dart';
import '../manager/companies_provider.dart';
import 'widgets/company_details_view_body.dart';
import 'widgets/company_details_view_header.dart';

class CompanyDetailsView extends StatelessWidget {
  const CompanyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<CompaniesProvider>();
    return Column(
      children: [
        SizedBox(height: 8),
        CompanyDetailsViewHeader(),
        SizedBox(height: 8),
        Expanded(
          child: prov.checkGetCompanyDetails == false
              ? ApiErrorView(msg: prov.message, onRetry: prov.getCompanyDetails)
              : CompanyDetailsViewBody(),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
