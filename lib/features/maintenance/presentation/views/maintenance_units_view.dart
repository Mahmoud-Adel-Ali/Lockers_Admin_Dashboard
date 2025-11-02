import 'package:flutter/material.dart';

import 'widgets/filter_maintenace_units_location_section.dart';

class MaintenanceUnitsView extends StatelessWidget {
  const MaintenanceUnitsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        FilterMaintenaceUnitsLocationSection(),
        SizedBox(height: 8),
      ],
    );
  }
}
