import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/api_error_widget.dart';
import '../manager/reservations_provider.dart';
import 'widgets/reservation_unit_details_header_view.dart';
import 'widgets/reservations_customers_grid_view.dart';

class ReservationUnitDetailsView extends StatelessWidget {
  const ReservationUnitDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ReservationsProvider>();
    return Column(
      children: [
        SizedBox(height: 8),
        FollowUpReservationsDetailsHeaderView(),
        SizedBox(height: 8),
        Expanded(
          child: prov.checkGettingUnitDetails == false
              ? ApiErrorView(msg: prov.message, onRetry: prov.getUnitDetails)
              : ReservationCustomersGridView(),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
