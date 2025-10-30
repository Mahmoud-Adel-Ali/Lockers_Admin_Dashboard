import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/profile_text_field.dart';

Future<dynamic> companyDetailsDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.9,
        ),

        child: Column(
          children: [
            Text('بيانات الحساب', style: AppTextStyles.style24w500(context)),
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage(Assets.imagesTestCompanyImage),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 16,
                children: [
                  AbsorbPointer(
                    child: Column(
                      spacing: 16,
                      children: [
                        ProfileTextField(
                          title: 'الإسم :',
                          controller: TextEditingController(
                            text: 'محمدخالد عبدالرازق',
                          ),
                          readOnly: true,
                        ),
                        ProfileTextField(
                          title: 'الإيميل :',
                          controller: TextEditingController(
                            text: 'www.noon.ecommerce.gov',
                          ),
                          readOnly: true,
                        ),
                        ProfileTextField(
                          title: 'رقم الهاتف :',
                          controller: TextEditingController(
                            text: '+20 0108765434567',
                          ),
                          readOnly: true,
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.filedGrey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'مصر - القاهرة - حي الزيتون',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.style20w500(
                                    context,
                                  ).copyWith(color: AppColors.main),
                                ),
                              ),
                              Image.asset(Assets.imagesGoogleMap, height: 24),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
