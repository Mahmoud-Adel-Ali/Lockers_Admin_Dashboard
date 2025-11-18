import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/size_config.dart';
import '../../manager/dashboard_manager.dart';
import '../../manager/functions/dashboard_subtitle.dart';

class AdminDashboardAppBar extends StatelessWidget {
  const AdminDashboardAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var prov = context.watch<DashboardManager>();
    return Container(
      color: AppColors.babyBlue,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              dashboardSubtitle(prov.type),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.style20w500(context),
            ),
          ),
          if (!SizeConfig.isMobile()) Image.asset(Assets.imagesLogo),
        ],
      ),
    );
  }
}
