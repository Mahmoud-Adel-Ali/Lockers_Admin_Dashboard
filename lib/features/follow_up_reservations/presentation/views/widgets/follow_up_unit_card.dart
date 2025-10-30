import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../dashboard/data/enums/dashboard_type.dart';
import '../../../../dashboard/presentation/manager/dashboard_manager.dart';

class FollowUpUnitCard extends StatelessWidget {
  const FollowUpUnitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log('onTap');
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
                    "Unit 01",
                    style: AppTextStyles.style20w500(
                      context,
                    ).copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              "23 عميل",
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
