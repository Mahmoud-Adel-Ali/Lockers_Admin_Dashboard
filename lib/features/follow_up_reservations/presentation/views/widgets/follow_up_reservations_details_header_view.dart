import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/custom_search_field.dart';
import '../../../../../core/widgets/dashboard_back_button.dart';
import '../../../../dashboard/data/enums/dashboard_type.dart';
import '../../../../dashboard/presentation/manager/dashboard_manager.dart';
import 'filter_customers_button.dart';

class FollowUpReservationsDetailsHeaderView extends StatelessWidget {
  const FollowUpReservationsDetailsHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DashboardBackIcon(
          onPressed: () {
            context.read<DashboardManager>().changeView(
              DashboardType.FollowUpReservations,
            );
          },
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: CustomSearchField(),
        ),
        const Spacer(),
        FilterCustomersButton(),
      ],
    );
  }
}
