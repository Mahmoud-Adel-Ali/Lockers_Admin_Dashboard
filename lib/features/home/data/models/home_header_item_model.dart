import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';

class HomeHeaderItemModel {
  final String title;
  final String subtitle;
  final String icon;
  final Color color;

  HomeHeaderItemModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
}

// List<HomeHeaderItemModel> homeHeaderItems = [
//   HomeHeaderItemModel(
//     title: '189',
//     subtitle: 'الحجوزات المتبقية للإشتراك',
//     icon: Assets.imagesReservationIcon,
//     color: AppColors.filedGrey,
//   ),
//   HomeHeaderItemModel(
//     title: '135',
//     subtitle: 'عدد الموظفين',
//     icon: Assets.imagesEmployeesIcon,
//     color: AppColors.babyBlue,
//   ),
//   HomeHeaderItemModel(
//     title: '135',
//     subtitle: 'ال Lockers قيد الحجز',
//     icon: Assets.imagesLockersIcon,
//     color: AppColors.blue.shade50,
//   ),
//   HomeHeaderItemModel(
//     title: '35',
//     subtitle: 'عدد ال Lockers  المتاحة للحجز',
//     icon: Assets.imagesBlueKey,
//     color: AppColors.blue.shade50,
//   ),
// ];
