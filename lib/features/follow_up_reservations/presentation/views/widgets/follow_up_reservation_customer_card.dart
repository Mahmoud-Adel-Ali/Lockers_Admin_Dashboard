import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/enum/locker_size.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/extensions/locker_extension.dart';
import '../../../../../core/functions/is_arabic.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../units/data/enum/order_status.dart';
import '../../../../units/data/models/order_model.dart';
import 'company_details_dialog.dart';

class FollowUpReservationCustomerCard extends StatelessWidget {
  const FollowUpReservationCustomerCard({super.key, required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        order.lockerNumber.toLockerNumberString(
                          context,
                          withEmoji: true,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.style14w400(
                          context,
                        ).copyWith(color: AppColors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Expanded(
                    flex: 5,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: customCachedNetworkImageprovider(
                              order.user.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          order.user.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.style16w500(
                            context,
                          ).copyWith(color: AppColors.black),
                        ),
                        Text(
                          order.user.phone,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.style16w500(
                            context,
                          ).copyWith(color: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          order.company == null
              ? const SizedBox()
              : InkWell(
                  onTap: () =>
                      companyDetailsDialog(context, company: order.company!),
                  child: Container(
                    color: AppColors.filedGrey,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Row(
                      spacing: 16,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: customCachedNetworkImageprovider(
                              order.company!.image,
                            ),
                          ),
                        ),
                        Text(
                          order.company!.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.style12w400(
                            context,
                          ).copyWith(color: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                ),

          Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.phosphorGreen,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        isArabic() ? order.size.arName : order.size.enName,
                        style: AppTextStyles.style14w500(
                          context,
                        ).copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.main,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        isArabic() ? order.status.arName : order.status.enName,
                        style: AppTextStyles.style14w500(
                          context,
                        ).copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
