import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/custom_user_card.dart';
import '../../../../../core/widgets/empty_grid_view_widget.dart';
import '../../../data/models/company_employee_model.dart';
import '../../manager/companies_provider.dart';
import 'employee_data_dialog.dart';

class CompanyEmployeesGridView extends StatelessWidget {
  const CompanyEmployeesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<CompaniesProvider>();
    List<CompanyEmployeeModel> employees = prov.companyDetails?.employees ?? [];
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        return employees.isEmpty
            ? EmptyGridViewWidget(msg: 'لا يوجد موظفين بعد')
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //* meaning that the minwidth of the card is 160.
                  crossAxisCount: (width / 160).toInt(),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 198.5 / 250,
                  mainAxisExtent: 190,
                ),
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  return CustomUserCard(
                    name: employees[index].name,
                    phone: employees[index].phone,
                    imgUrl: employees[index].image,
                    onTap: () =>
                        showEmployeeDialog(context, employee: employees[index]),
                  );
                },
              );
      },
    );
  }
}
