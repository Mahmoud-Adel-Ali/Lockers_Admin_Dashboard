import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/functions/convert_location_to_text.dart';
import '../../../../../core/models/location_details_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/views/show_location_view.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../data/models/company_model.dart';
import '../../manager/companies_provider.dart';
import 'company_info_item.dart';

class CompanyBasicInfoSection extends StatelessWidget {
  const CompanyBasicInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<CompaniesProvider>();
    CompanyModel? company = prov.companyDetails;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.whiteGrey,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Skeletonizer(
        enabled: prov.checkGetCompanyDetails == null,
        child: Column(
          spacing: 12,
          children: [
            SizedBox(),
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: customCachedNetworkImageprovider(company?.image),
              ),
            ),
            SizedBox(),
            Text(
              company?.name ?? '',
              style: AppTextStyles.style24w500(context),
            ),
            SizedBox(),
            CompanyInfoItem(
              title: 'قسم الإدارة :',
              value: company?.adminName ?? '',
            ),
            CompanyInfoItem(title: 'رقم الهاتف :', value: company?.phone ?? ''),
            CompanyInfoItem(title: 'الإيميل :', value: company?.email ?? ''),
            CompanyInfoItem(
              title: 'الموقع :',
              value: convertLocationToText(
                context,
                city: company?.city,
                neighborhood: company?.neighborhood,
                street: company?.street,
                buildingNum: company?.buildNumber,
              ),
              trailing: Image.asset(
                Assets.imagesGoogleMap,
                width: 20,
                height: 20,
              ),
              onTap: () {
                LocationDetailsModel location = LocationDetailsModel(
                  city: company?.city ?? '',
                  neighborhood: company?.neighborhood ?? '',
                  street: company?.street ?? '',
                  buildingNum: company?.buildNumber ?? '',
                  latitude: company?.latitude ?? 0.0,
                  longitude: company?.longitude ?? 0.0,
                );
                Navigator.pushNamed(
                  context,
                  ShowLocationView.routeName,
                  arguments: location,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
