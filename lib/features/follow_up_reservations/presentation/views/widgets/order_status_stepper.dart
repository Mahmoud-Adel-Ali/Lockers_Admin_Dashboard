import 'package:flutter/material.dart';

import '../../../../../core/functions/is_arabic.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../units/data/enum/order_status.dart';

class OrderStatusStepper extends StatelessWidget {
  final OrderStatus currentStatus;

  const OrderStatusStepper({super.key, required this.currentStatus});

  List<OrderStatus> get steps => [
    OrderStatus.waitingQrScan,
    OrderStatus.bookingActivated,
    OrderStatus.lockerReleased,
    OrderStatus.lateClearance,
    OrderStatus.backToCompany,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmall = constraints.maxWidth < 600;

          final stepWidgets = Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.filedGrey,
              border: Border.all(color: AppColors.filedGrey, width: 1.5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: List.generate(steps.length * 2 - 1, (i) {
                if (i.isEven) {
                  // Step Circle
                  final stepIndex = i ~/ 2;
                  final status = steps[stepIndex];
                  final isActive = stepIndex <= steps.indexOf(currentStatus);

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Circle
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isActive
                              ? AppColors.main
                              : Colors.grey.shade300,
                        ),
                        child: Icon(
                          Icons.check,
                          size: 18,
                          color: isActive ? Colors.white : Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Text under the circle
                      SizedBox(
                        width: 90,
                        child: Text(
                          isArabic() ? status.arName : status.enName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isActive
                                ? FontWeight.bold
                                : FontWeight.w400,
                            color: isActive ? AppColors.main : Colors.grey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  );
                } else {
                  // Line between steps
                  return Expanded(
                    child: Container(
                      height: 2,
                      color: (i ~/ 2) < steps.indexOf(currentStatus)
                          ? AppColors.main
                          : Colors.grey.shade300,
                    ),
                  );
                }
              }),
            ),
          );

          /// Enable scroll on small screens
          if (isSmall) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(width: 800, child: stepWidgets),
            );
          }

          return stepWidgets;
        },
      ),
    );
  }
}
