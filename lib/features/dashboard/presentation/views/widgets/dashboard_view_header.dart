import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/dashboard_manager.dart';
import '../../manager/functions/company_dashboard_subtitle.dart';

class DashboardViewHeader extends StatelessWidget {
  const DashboardViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // DashboardModel item = adminFeaturesList.last;
    return Consumer<DashboardManager>(
      builder: (_, prov, _) => Row(
        children: [
          Text(
            companyDashboardSubtitle(prov.type),
            style: AppTextStyles.style32w400(
              context,
            ).copyWith(color: AppColors.main),
          ),
          const Spacer(),
          // SizedBox(
          //   width: 180,
          //   child: FilterButton(
          //     title: item.title,
          //     activeIcon: item.activeIcon,
          //     inactiveIcon: item.inactiveIcon,
          //     isSelected: item.type == prov.type,
          //     onTap: () => prov.changeView(item.type),
          //   ),
          // ),
        ],
      ),
    );
  }
}
