import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widgets/empty_grid_view_widget.dart';
import '../../../data/models/company_model.dart';
import '../../manager/companies_provider.dart';
import 'company_card.dart';

class CompaniesGridView extends StatelessWidget {
  const CompaniesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<CompaniesProvider>();
    List<CompanyModel> companies = prov.companies;
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        return prov.companies.isEmpty
            ? EmptyGridViewWidget(msg: 'لا يوجد شركات بعد')
            : Skeletonizer(
                enabled: prov.checkGetAllCompanies == null,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //* meaning that the minwidth of the card is 180.
                    crossAxisCount: (width / 180).toInt(),
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 198.5 / 250,
                    mainAxisExtent: 210,
                  ),
                  itemCount: companies.length,
                  itemBuilder: (context, index) {
                    return CompanyCard(company: companies[index]);
                  },
                ),
              );
      },
    );
  }
}
