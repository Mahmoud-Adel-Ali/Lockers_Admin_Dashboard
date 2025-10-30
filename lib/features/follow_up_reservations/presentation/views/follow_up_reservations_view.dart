import 'package:flutter/material.dart';

import 'widgets/filter_follow_up_units_location_section.dart';

class FollowUpReservationsView extends StatelessWidget {
  const FollowUpReservationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 16,
      children: [
        FilterFollowUpUnitsLocationSection(),
        //
      ],
    );
  }
}
