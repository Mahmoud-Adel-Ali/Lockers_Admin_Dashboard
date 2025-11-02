import 'package:flutter/material.dart';

import 'widgets/filter_maintenace_lockers_location_section.dart';

class MaintenanceLockersView extends StatelessWidget {
  const MaintenanceLockersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        FilterMaintenaceLockersLocationSection(),
        SizedBox(height: 8),
      ],
    );
  }
}
