import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/filter_button.dart';
import 'maintenance_lockers_view.dart';
import 'maintenance_units_view.dart';

enum MaintenanceTab { units, lockers }

class MaintenanceView extends StatefulWidget {
  const MaintenanceView({super.key});

  @override
  State<MaintenanceView> createState() => _MaintenanceViewState();
}

class _MaintenanceViewState extends State<MaintenanceView> {
  MaintenanceTab selectedTab = MaintenanceTab.units;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 8),
          Row(
            spacing: 16,
            children: [
              FilterButton(
                title: '  الوحدات  ',
                isSelected: selectedTab == MaintenanceTab.units,
                activeIcon: Assets.imagesActiveUnitsIcon,
                inactiveIcon: Assets.imagesInactiveUnitsIcon,
                onTap: () => setState(() => selectedTab = MaintenanceTab.units),
              ),
              FilterButton(
                title: '  الخزائن  ',
                isSelected: selectedTab == MaintenanceTab.lockers,
                activeIcon: Assets.imagesActiveFollowUpReservationIcon,
                inactiveIcon: Assets.imagesInactiveFollowUpReservationIcon,
                onTap: () =>
                    setState(() => selectedTab = MaintenanceTab.lockers),
              ),
            ],
          ),
          if (selectedTab == MaintenanceTab.units)
            Expanded(child: const MaintenanceUnitsView()),
          if (selectedTab == MaintenanceTab.lockers)
            Expanded(child: const MaintenanceLockersView()),
        ],
      ),
    );
  }
}
