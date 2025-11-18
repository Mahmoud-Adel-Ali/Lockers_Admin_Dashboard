import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/api_error_widget.dart';
import '../../../../core/widgets/empty_grid_view_widget.dart';
import '../manager/maintenance_provider.dart';
import 'widgets/filter_maintenace_lockers_location_section.dart';
import 'widgets/maintenance_lockers_grid_view.dart';

class MaintenanceLockersView extends StatelessWidget {
  const MaintenanceLockersView({super.key});
  @override
  Widget build(BuildContext context) {
    var prov = context.watch<MaintenanceProvider>();
    var lockers = prov.filteredMaintenanceLockersList;
    return prov.checkGetMaintenanceLockers == false
        ? ApiErrorView(msg: prov.message, onRetry: prov.getMaintenanceLockers)
        : Column(
            children: [
              SizedBox(height: 8),
              FilterMaintenaceLockersLocationSection(),
              SizedBox(height: 8),
              Expanded(
                child: lockers.isEmpty
                    ? EmptyGridViewWidget(msg: 'لا يوجد خزائن بعد')
                    : MaintenanceLockersGridView(),
              ),
              SizedBox(height: 8),
            ],
          );
  }
}
