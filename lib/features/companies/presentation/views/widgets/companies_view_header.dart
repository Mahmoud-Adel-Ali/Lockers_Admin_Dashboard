import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import 'add_company_button.dart';
import 'companies_search_field.dart';

class CompaniesViewHeader extends StatelessWidget {
  const CompaniesViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          if (!SizeConfig.isMobile()) AddCompanyButton(),
          if (!SizeConfig.isMobile()) const Spacer(),
          Expanded(child: CompaniesSearchField()),
        ],
      ),
    );
  }
}
