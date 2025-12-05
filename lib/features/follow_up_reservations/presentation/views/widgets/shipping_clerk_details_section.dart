import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_info_field.dart';
import '../../../../home/presentation/views/widgets/section_header_list_tile.dart';
import '../../../../units/data/models/order_employee_model.dart';

class ShippingClerkDetailsSection extends StatelessWidget {
  const ShippingClerkDetailsSection({super.key, required this.employee});
  final OrderEmployeeModel employee;

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
            title: 'بيانات موظف الشحن',
            svgIcon: Assets.imagesActiveEmployeesIcon,
          ),
          Expanded(
            child: ShippingEmployeeDetailsSectionBody(employee: employee),
          ),
        ],
      ),
    );
  }
}

class ShippingEmployeeDetailsSectionBody extends StatelessWidget {
  const ShippingEmployeeDetailsSectionBody({super.key, required this.employee});
  final OrderEmployeeModel employee;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Column(
        spacing: 16,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.phosphorGreen),
              image: customCachedNetworkImageprovider(employee.image),
            ),
          ),

          CustomInfoField(title: 'الإسم', info: employee.name),
          CustomInfoField(title: 'الإيميل', info: employee.email),
          CustomInfoField(title: 'رقم التواصل', info: employee.phone),
        ],
      ),
    );
  }
}
