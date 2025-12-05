import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../units/data/models/order_model.dart';
import '../../manager/reservations_provider.dart';
import 'customer_details_section.dart';
import 'order_status_stepper.dart';
import 'shipping_clerk_details_section.dart';
import 'unit_details_section.dart';

class ReservationDetailsViewBody extends StatelessWidget {
  const ReservationDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isMobile = SizeConfig.isMobile();
    OrderModel order = context.read<ReservationsProvider>().selectedOrder!;
    var children = [
      Expanded(child: CustomerDetailsSection(customer: order.user)),
      Expanded(child: UnitDetailsSection(order: order)),
      if (order.employee != null)
        Expanded(child: ShippingClerkDetailsSection(employee: order.employee!)),
    ];
    return Column(
      spacing: 16,
      children: [
        OrderStatusStepper(currentStatus: order.status),
        Expanded(
          child: isMobile
              ? Column(spacing: 12, children: children)
              : Row(spacing: 12, children: children),
        ),
      ],
    );
  }
}
