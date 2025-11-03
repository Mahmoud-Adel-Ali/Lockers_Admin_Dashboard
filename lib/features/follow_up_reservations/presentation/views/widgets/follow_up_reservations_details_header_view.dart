import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/utils/size_config.dart';
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
    SizeConfig.init(context);
    bool isMobile = SizeConfig.isMobile();
    return Row(
      children: [
        DashboardBackIcon(
          onPressed: () {
            context.read<DashboardManager>().changeView(
              DashboardType.FollowUpReservations,
            );
          },
        ),
        Expanded(child: CustomSearchField()),
        if (!isMobile) const Spacer(flex: 2) else SizedBox(width: 16),
        FilterCustomersButton(),
      ],
    );
  }
}
