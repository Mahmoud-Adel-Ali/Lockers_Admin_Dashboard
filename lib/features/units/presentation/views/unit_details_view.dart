import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/functions/convert_location_to_text.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/show_location_container.dart';
import '../manager/units_provider.dart';
import 'widgets/add_new_locker_dialog.dart';
import 'widgets/header_unit_info_section.dart';
import 'widgets/lockers_grid_view.dart';
import 'widgets/unit_details_view_header.dart';

class UnitDetailsView extends StatelessWidget {
  const UnitDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isMobile = SizeConfig.isMobile();
    return Scaffold(
      floatingActionButton: !isMobile
          ? null
          : FloatingActionButton(
              backgroundColor: AppColors.main,
              onPressed: () => addNewLockerDialog(context),
              child: const Icon(Icons.add, color: Colors.white),
            ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          UnitDetailsViewHeader(),
          const SizedBox(height: 8),
          Row(
            children: [
              // الموقع
              if (!isMobile)
                UnitLocationInfo()
              else
                const Expanded(child: UnitLocationInfo()),
              if (!isMobile) const Spacer(),
              if (!isMobile) HeaderUnitInfoSection(),
            ],
          ),

          const SizedBox(height: 12),
          Expanded(child: LockersGridView()),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class UnitLocationInfo extends StatelessWidget {
  const UnitLocationInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<UnitsProvider>();
    var unit = prov.selectedUnit;
    return Skeletonizer(
      enabled: prov.checkGettingUnitDetails == null,
      child: ShowLocationContainer(
        text: convertLocationToText(
          context,
          city: unit?.city,
          neighborhood: unit?.neighborhood,
          street: unit?.street,
          buildingNum: unit?.buildNumber,
        ),
      ),
    );
  }
}
