import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/extensions/customers_extension.dart';
import 'package:lockers_admin_dashboard/core/extensions/unit_extension.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/models/unit_model.dart';
import '../../../../dashboard/data/enums/dashboard_type.dart';
import '../../../../dashboard/presentation/manager/dashboard_manager.dart';
import '../../manager/reservations_provider.dart';

class ReservationUnitCard extends StatelessWidget {
  const ReservationUnitCard({super.key, required this.unit});
  final UnitModel unit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ReservationsProvider>().onSelectUnit(unit);
        context.read<DashboardManager>().changeView(
          DashboardType.FollowUpReservationsDetails,
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.phosphorGreen,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.main,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    unit.unitNumber.toUnitString(context),
                    style: AppTextStyles.style20w500(
                      context,
                    ).copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              unit.unitNumber.toCustomerString(context),
              style: AppTextStyles.style20w500(
                context,
              ).copyWith(color: AppColors.white),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
