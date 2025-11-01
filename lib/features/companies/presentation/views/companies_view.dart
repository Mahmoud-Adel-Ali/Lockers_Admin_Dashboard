import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import 'widgets/add_new_company_dialog.dart';
import 'widgets/companies_grid_view.dart';
import 'widgets/companies_view_header.dart';

class CompaniesView extends StatelessWidget {
  const CompaniesView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isMobile = SizeConfig.isMobile();
    return Scaffold(
      floatingActionButton: !isMobile
          ? null
          : FloatingActionButton(
              backgroundColor: AppColors.main,
              onPressed: () => addNewCompanyDialog(context),
              child: const Icon(Icons.add, color: Colors.white),
            ),
      body: Column(
        children: [
          CompaniesViewHeader(),
          SizedBox(height: 8),
          Expanded(child: CompaniesGridView()),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
