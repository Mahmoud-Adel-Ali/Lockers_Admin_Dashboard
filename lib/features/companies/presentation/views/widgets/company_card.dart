import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/widgets/custom_cached_network_image.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../dashboard/data/enums/dashboard_type.dart';
import '../../../../dashboard/presentation/manager/dashboard_manager.dart';
import '../../../data/models/company_model.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({super.key, required this.company});
  final CompanyModel company;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<DashboardManager>().changeView(
          DashboardType.CompanyDetails,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: customCachedNetworkImageprovider(
                        company.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Text(
                    company.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.style16w500(
                      context,
                    ).copyWith(color: AppColors.black),
                  ),
                  SizedBox(height: 4),
                  Text(
                    company.phone,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.style16w400(
                      context,
                    ).copyWith(color: AppColors.black),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
