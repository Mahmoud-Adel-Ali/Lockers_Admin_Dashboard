import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/functions/is_arabic.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/custom_popup_menu_button.dart';
import '../../../data/enums/permission_type.dart';
import '../../manager/employees_provider.dart';

class EmployeesSelectorField extends StatelessWidget {
  const EmployeesSelectorField({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<EmployeesProvider>();

    final List<PermissionType> items = [
      PermissionType.all, // all is true
      PermissionType.manageShippingCompanies, // manageShippingCompanies is true
      PermissionType.manageUnits, // manageUnits is true
      PermissionType.followReservations, // followReservations is true
      PermissionType.manageCustomers, // manageCustomers is true
      PermissionType.manageComplaints, // manageComplaints is true
      PermissionType.manageMaintenance, // manageMaintenance is true
    ];

    return CustomPopupMenuButton<PermissionType>(
      items: items,
      initialValue: prov.permissionType,
      itemLabelBuilder: (item) =>
          isArabic() ? item.arName : item.enName, // how to display each item
      onSelected: (index) {
        log("Selected: ${items[index]}");
        prov.filterEmployees(permissionType: items[index]);
      },
    );
  }
}
