import 'package:flutter/material.dart';

import 'widgets/filter_follow_up_units_location_section.dart';
import 'widgets/follow_up_units_grid_view.dart';

class FollowUpReservationsView extends StatelessWidget {
  const FollowUpReservationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: const Column(
        children: [
          SizedBox(height: 8),
          FilterFollowUpUnitsLocationSection(),
          SizedBox(height: 8),
          FollowUpUnitsGridView(),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
