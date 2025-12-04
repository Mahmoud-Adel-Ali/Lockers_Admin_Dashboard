import 'package:flutter/material.dart';

import '../../../../../core/functions/convert_location_to_text.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/profile_text_field.dart';
import '../../../../units/data/models/order_company_model.dart';

Future<dynamic> companyDetailsDialog(
  BuildContext context, {
  required OrderCompanyModel company,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        constraints: BoxConstraints(maxWidth: 500, maxHeight: 580),
        child: Column(
          children: [
            Text('بيانات الحساب', style: AppTextStyles.style24w500(context)),
            const SizedBox(height: 16),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: customCachedNetworkImageprovider(company.image),
              ),
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
                          controller: TextEditingController(text: company.name),
                          readOnly: true,
                        ),

                        ProfileTextField(
                          title: 'الإيميل :',
                          controller: TextEditingController(
                            text: company.email,
                          ),
                          readOnly: true,
                        ),
                        ProfileTextField(
                          title: 'رقم الهاتف :',
                          controller: TextEditingController(
                            text: company.phone,
                          ),
                          readOnly: true,
                        ),

                        // ShowLocationContainer(
                        //   text: convertLocationToText(
                        //     context,
                        //     city: company.city,
                        //     neighborhood: company.neighborhood,
                        //     street: company.street,
                        //     buildingNum: company.building,
                        //   ),
                        // ),
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
                                  convertLocationToText(
                                    context,
                                    city: company.city,
                                    neighborhood: company.neighborhood,
                                    street: company.street,
                                    buildingNum: company.building,
                                  ),
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
