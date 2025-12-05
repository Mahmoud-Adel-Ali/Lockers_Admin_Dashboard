import 'package:flutter/material.dart';

import '../../../../../core/functions/convert_location_to_text.dart';
import '../../../../../core/models/location_details_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/views/show_location_view.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_info_field.dart';
import '../../../../home/presentation/views/widgets/section_header_list_tile.dart';
import '../../../../units/data/models/order_user_model.dart';

class CustomerDetailsSection extends StatelessWidget {
  const CustomerDetailsSection({super.key, required this.customer});
  final OrderUserModel customer;

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
            title: 'بيانات العميل',
            svgIcon: Assets.imagesActiveEmployeesIcon,
          ),
          Expanded(child: CustomerDetailsSectionBody(customer: customer)),
        ],
      ),
    );
  }
}

class CustomerDetailsSectionBody extends StatelessWidget {
  const CustomerDetailsSectionBody({super.key, required this.customer});
  final OrderUserModel customer;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.phosphorGreen),
            image: customCachedNetworkImageprovider(customer.image),
          ),
        ),

        CustomInfoField(title: 'الإسم', info: customer.name),
        CustomInfoField(title: 'الإيميل', info: customer.email),
        CustomInfoField(title: 'رقم التواصل', info: customer.phone),

        //* Meaning that the order is related to AppUser and not a customer [from shipping clerk]
        if (customer.latitude != 0.0 && customer.longitude != 0.0)
          InkWell(
            onTap: () {
              var locationDetails = LocationDetailsModel(
                latitude: customer.latitude,
                longitude: customer.longitude,
                city: customer.city,
                neighborhood: customer.neighborhood,
                street: customer.street,
                buildingNum: customer.buildNumber,
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
                  city: customer.city,
                  neighborhood: customer.neighborhood,
                  street: customer.street,
                  buildingNum: customer.buildNumber,
                ),
                suffixIcon: Image.asset(Assets.imagesGoogleMap, height: 24),
              ),
            ),
          )
        else
          CustomInfoField(
            title: 'العنوان',
            info: convertLocationToText(
              context,
              city: customer.city,
              neighborhood: customer.neighborhood,
            ),
          ),
      ],
    );
  }
}
