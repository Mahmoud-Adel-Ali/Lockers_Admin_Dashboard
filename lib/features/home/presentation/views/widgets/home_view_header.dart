import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../data/models/home_header_item_model.dart';
import '../../manager/home_provider.dart';
import 'home_header_item.dart';
import 'horizontal_divider.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<HomeProvider>();

    SizeConfig.init(context);
    // TODO : change this values after added to the response API
    List<HomeHeaderItemModel> homeHeaderItems = [
      HomeHeaderItemModel(
        title: prov.newUser.toString(),
        subtitle: 'عدد العملاء الجدد',
        icon: Assets.imagesNewCustomersIcon,
        color: AppColors.filedGrey,
      ),
      HomeHeaderItemModel(
        title: prov.companies.toString(),
        subtitle: 'عدد الشركات',
        icon: Assets.imagesCompaniesIcon,
        color: AppColors.green.shade50,
      ),
      HomeHeaderItemModel(
        title: prov.complains.toString(),
        subtitle: 'عدد الشكاوي',
        icon: Assets.imagesComplaintsIcon,
        color: AppColors.orange.shade50,
      ),
      HomeHeaderItemModel(
        title: prov.employees.toString(),
        subtitle: 'عدد الموظفين',
        icon: Assets.imagesEmployeesIcon,
        color: AppColors.red.shade50,
      ),
    ];

    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.filedGrey, width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: !SizeConfig.isMobile()
          ? Skeletonizer(
              enabled: prov.checkGetHomeDashboardData == null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HomeHeaderItem(item: homeHeaderItems[0]),
                  HorizontalDivider(),
                  HomeHeaderItem(item: homeHeaderItems[1]),
                  HorizontalDivider(),
                  HomeHeaderItem(item: homeHeaderItems[2]),
                  HorizontalDivider(),
                  HomeHeaderItem(item: homeHeaderItems[3]),
                ],
              ),
            )
          : Skeletonizer(
              enabled: prov.checkGetHomeDashboardData == null,
              child: Column(
                children: [
                  Row(
                    children: [
                      HomeHeaderItem(item: homeHeaderItems[0]),
                      HorizontalDivider(),
                      HomeHeaderItem(item: homeHeaderItems[1]),
                    ],
                  ),
                  const Divider(height: 0),
                  Row(
                    children: [
                      HomeHeaderItem(item: homeHeaderItems[2]),
                      HorizontalDivider(),
                      HomeHeaderItem(item: homeHeaderItems[3]),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
