import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widgets/custom_user_card.dart';
import '../../manager/employees_provider.dart';
import 'show_employee_data_dialog.dart';

class EmployeesGridView extends StatelessWidget {
  const EmployeesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<EmployeesProvider>();
    var employees = prov.filteredEmployees;
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        return Skeletonizer(
          enabled: prov.checkGetAllEmployees == null,
          child: GridView.builder(
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
                onTap: () {
                  prov.fillEmployeeData(employees[index]);
                  showEmployeeDataDialog(context, employee: employees[index]);
                },
              );
            },
          ),
        );
      },
    );
  }
}
