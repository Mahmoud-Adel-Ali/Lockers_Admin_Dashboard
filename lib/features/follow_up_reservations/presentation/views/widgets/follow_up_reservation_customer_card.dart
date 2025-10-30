import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import 'company_details_dialog.dart';

class FollowUpReservationCustomerCard extends StatelessWidget {
  const FollowUpReservationCustomerCard({super.key});

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
                        'الخزينه رقم : 1',
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
                        return CircleAvatar(
                          backgroundColor: AppColors.whiteGrey,
                          radius: constraints.maxHeight / 2,
                          child: Image.asset(
                            Assets.imagesTestUserImage,
                            height: 100,
                            width: 100,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'أحمد علي خالد',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.style16w500(
                            context,
                          ).copyWith(color: AppColors.black),
                        ),
                        Text(
                          '01000000000',
                          maxLines: 1,
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
          InkWell(
            onTap: () => companyDetailsDialog(context),
            child: Container(
              color: AppColors.filedGrey,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                spacing: 16,
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage(Assets.imagesTestCompanyImage),
                  ),
                  Text(
                    'شركه الشحن',
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
                        'Large',
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
                        'تم إنهاء الحجز',
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
