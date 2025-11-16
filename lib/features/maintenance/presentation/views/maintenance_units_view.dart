import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/api_error_widget.dart';
import '../manager/maintenance_provider.dart';
import 'widgets/filter_maintenace_units_location_section.dart';
import 'widgets/maintenance_units_grid_view.dart';

class MaintenanceUnitsView extends StatelessWidget {
  const MaintenanceUnitsView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<MaintenanceProvider>();
    return prov.checkGetMaintenanceUnits == false
        ? ApiErrorView(msg: prov.message, onRetry: prov.getMaintenanceUnits)
        : Column(
            children: [
              SizedBox(height: 8),
              FilterMaintenaceUnitsLocationSection(),
              SizedBox(height: 8),
              Expanded(child: MaintenanceUnitsGridView()),
              SizedBox(height: 8),
            ],
          );
  }
}
