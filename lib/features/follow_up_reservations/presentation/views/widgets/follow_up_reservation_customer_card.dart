import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/enum/locker_size.dart';
import 'package:lockers_admin_dashboard/core/enum/locker_status.dart';
import 'package:lockers_admin_dashboard/core/extensions/locker_extension.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/functions/is_arabic.dart';
import '../../../../../core/models/user_model.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import 'company_details_dialog.dart';

class FollowUpReservationCustomerCard extends StatelessWidget {
  const FollowUpReservationCustomerCard({super.key, required this.user});
  final UserModel user;

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
                        user.lockerNum.toLockerNumberString(
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
                              user.image,
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          user.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.style16w500(
                            context,
                          ).copyWith(color: AppColors.black),
                        ),
                        Text(
                          user.phone,
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
          user.company == null
              ? const SizedBox()
              : InkWell(
                  onTap: () =>
                      companyDetailsDialog(context, company: user.company!),
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
                              user.company!.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Text(
                          user.company!.name,
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
                        isArabic() ? user.size.arName : user.size.enName,
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
                        isArabic() ? user.status.arName : user.status.enName,
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
