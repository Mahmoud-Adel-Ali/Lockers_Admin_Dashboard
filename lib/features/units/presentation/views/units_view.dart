import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import 'widgets/add_new_unit_dialog.dart';
import 'widgets/add_unit_button.dart';
import 'widgets/filter_units_location_section.dart';
import 'widgets/units_grid_view.dart';

class UnitsView extends StatelessWidget {
  const UnitsView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isMobile = SizeConfig.isMobile();
    return Scaffold(
      floatingActionButton: !isMobile
          ? null
          : FloatingActionButton(
              backgroundColor: AppColors.main,
              onPressed: () => addNewUnitDialog(context),
              child: const Icon(Icons.add, color: Colors.white),
            ),
      body: Column(
        children: [
          SizedBox(height: 8),
          if (!isMobile) Row(children: [const Spacer(), AddUnitButton()]),
          if (!isMobile) SizedBox(height: 8),
          FilterUnitsLocationSection(),
          SizedBox(height: 8),
          Expanded(child: UnitsGridView()),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
