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

    List<HomeHeaderItemModel> homeHeaderItems = [
      HomeHeaderItemModel(
        title: prov.totalUnits.toString(),
        subtitle: 'عدد الوحدات',
        icon: Assets.imagesUnitIcon1,
        color: AppColors.filedGrey,
      ),
      HomeHeaderItemModel(
        title: prov.totalLockers.toString(),
        subtitle: 'عدد الخزائن',
        icon: Assets.imagesLockerIcon1,
        color: AppColors.babyBlue,
      ),
      HomeHeaderItemModel(
        title: prov.unitsUnderMaintenance.toString(),
        subtitle: 'عدد الوحدات في الصيانة',
        icon: Assets.imagesUnitIcon2,
        color: AppColors.green.shade50,
      ),
      HomeHeaderItemModel(
        title: prov.lockersUnderMaintenance.toString(),
        subtitle: 'عدد الخزائن في الصيانة',
        icon: Assets.imagesLockerIcon2,
        color: AppColors.orange.shade50,
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
