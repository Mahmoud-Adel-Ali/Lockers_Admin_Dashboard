import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/api_error_widget.dart';
import '../../../../core/widgets/empty_grid_view_widget.dart';
import '../manager/maintenance_provider.dart';
import 'widgets/filter_maintenace_units_location_section.dart';
import 'widgets/maintenance_units_grid_view.dart';

class MaintenanceUnitsView extends StatelessWidget {
  const MaintenanceUnitsView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<MaintenanceProvider>();
    var units = prov.filteredMaintenanceUnitsList;
    return prov.checkGetMaintenanceUnits == false
        ? ApiErrorView(msg: prov.message, onRetry: prov.getMaintenanceUnits)
        : Column(
            children: [
              SizedBox(height: 8),
              FilterMaintenaceUnitsLocationSection(),
              SizedBox(height: 8),
              Expanded(
                child: units.isEmpty
                    ? EmptyGridViewWidget(msg: 'لا توجد وحدات بعد')
                    : MaintenanceUnitsGridView(),
              ),
              SizedBox(height: 8),
            ],
          );
  }
}
