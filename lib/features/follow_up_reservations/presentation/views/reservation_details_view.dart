import 'package:flutter/material.dart';

import 'widgets/reservation_details_view_body.dart';
import 'widgets/reservation_details_view_header.dart';

class ReservationDetailsView extends StatelessWidget {
  const ReservationDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        ReservationDetailsHeaderSection(),
        SizedBox(height: 12),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: ReservationDetailsViewBody(),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
