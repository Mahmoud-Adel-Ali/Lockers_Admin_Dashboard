import 'package:flutter/material.dart';

import '../../../../../core/enum/locker_size.dart';
import '../../../../../core/extensions/locker_extension.dart';
import '../../../../../core/extensions/unit_extension.dart';
import '../../../../../core/functions/convert_location_to_text.dart';
import '../../../../../core/functions/is_arabic.dart';
import '../../../../../core/models/location_details_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/views/show_location_view.dart';
import '../../../../../core/widgets/custom_info_field.dart';
import '../../../../home/presentation/views/widgets/section_header_list_tile.dart';
import '../../../../units/data/models/order_model.dart';

class UnitDetailsSection extends StatelessWidget {
  const UnitDetailsSection({super.key, required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.filedGrey, width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          SectionHeaderListTile(
            title: 'بيانات الحجز',
            svgIcon: Assets.imagesActiveUnitsIcon,
          ),
          Expanded(child: UnitDetailsBody(order: order)),
        ],
      ),
    );
  }
}

class UnitDetailsBody extends StatelessWidget {
  const UnitDetailsBody({super.key, required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Column(
          spacing: 16,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundColor: AppColors.phosphorGreen,
              child: Column(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    order.lockerNumber.toLockerNumberString(context),
                    style: AppTextStyles.style20w700(
                      context,
                    ).copyWith(color: AppColors.white),
                  ),
                  Text(
                    order.unit.unitNumber.toUnitString(context),
                    style: AppTextStyles.style16w700(
                      context,
                    ).copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ),
            CustomInfoField(
              title: 'حجم الخزينة',
              info: isArabic() ? order.size.arName : order.size.enName,
            ),

            CustomInfoField(title: 'تاريخ بدء الحجز', info: order.placeAtDate),
            CustomInfoField(
              title: 'تاريخ إنتهاء الحجز',
              info: order.placeUpDate,
            ),
            CustomInfoField(
              title: 'وقت حجز الخزينة',
              info: order.placeAtDateHour,
            ),
            CustomInfoField(
              title: 'وقت تفريغ الخزينة',
              info: order.placeUpDateHour,
            ),
          ],
        ),

        InkWell(
          onTap: () {
            var locationDetails = LocationDetailsModel(
              latitude: order.unit.latitude,
              longitude: order.unit.longitude,
              city: order.unit.city,
              neighborhood: order.unit.neighborhood,
              street: order.unit.street,
              buildingNum: order.unit.buildNumber,
            );
            Navigator.pushNamed(
              context,
              ShowLocationView.routeName,
              arguments: locationDetails,
            );
          },
          child: AbsorbPointer(
            child: CustomInfoField(
              title: convertLocationToText(
                context,
                city: order.unit.city,
                neighborhood: order.unit.neighborhood,
                street: order.unit.street,
                buildingNum: order.unit.buildNumber,
              ),
              suffixIcon: Image.asset(Assets.imagesGoogleMap, height: 24),
            ),
          ),
        ),
      ],
    );
  }
}
