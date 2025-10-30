import 'package:flutter/material.dart';

import 'widgets/follow_up_reservations_details_header_view.dart';

class FollowUpReservationsDetailsView extends StatelessWidget {
  const FollowUpReservationsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: const Column(
        children: [
          FollowUpReservationsDetailsHeaderView(),
          //
        ],
      ),
    );
  }
}
