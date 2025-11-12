import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/custom_search_field.dart';
import '../../manager/companies_provider.dart';

class CompaniesSearchField extends StatelessWidget {
  const CompaniesSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<CompaniesProvider>();
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomSearchField(
          hintText: 'ابحث عن شركة',
          controller: prov.searchCompanyController,
          onChanged: (val) {
            if (prov.checkGetAllCompanies == null) return;
            prov.getAllCompanies();
          },
        ),
      ),
    );
  }
}
