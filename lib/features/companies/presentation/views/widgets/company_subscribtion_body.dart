import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_circle_percent_indicator.dart';
import '../../../data/models/company_model.dart';
import '../../manager/companies_provider.dart';
import 'company_info_item.dart';

class CompanySubscribtionBody extends StatelessWidget {
  const CompanySubscribtionBody({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<CompaniesProvider>();
    CompanyModel? company = prov.companyDetails;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: AppColors.filedGrey,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Skeletonizer(
        enabled: prov.checkGetCompanyDetails == null,
        child: Column(
          spacing: 8,
          children: [
            ListTile(
              title: Text(
                'الإستهلاك',
                style: AppTextStyles.style20w500(context),
              ),
              trailing: Text(
                company?.subscription?.name ?? '',
                style: AppTextStyles.style20w500(context),
              ),
            ),
            CustomCirclePercentIndicator(
              text: '${company?.subscription?.remainLockers ?? 0}\nحجز متبقي',
              percent: prov.checkGetCompanyDetails == null
                  ? 0.0
                  : (company?.subscription?.percentage.toDouble() ?? 0.0) / 100,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 8,
                children: [
                  CompanyInfoItem(
                    title: 'عدد الحجوزات :',
                    value: '${company?.subscription?.countLocker ?? 0} حجز',
                  ),
                  CompanyInfoItem(
                    title: 'سعر الباقة :',
                    value: '${company?.subscription?.price ?? 0} جنيه',
                  ),
                  CompanyInfoItem(
                    title: 'مدة الباقة :',
                    value: '${company?.subscription?.duration ?? 0} شهر',
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
