import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import 'company_info_item.dart';

class CompanyBasicInfoSection extends StatelessWidget {
  const CompanyBasicInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.whiteGrey,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        spacing: 12,
        children: [
          SizedBox(),
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(Assets.imagesTestCompanyImage),
          ),
          SizedBox(),
          Text(
            'شركة NYEX للإستيراد والتصدير',
            style: AppTextStyles.style24w500(context),
          ),
          SizedBox(),
          CompanyInfoItem(
            title: 'قسم الإدارة :',
            value: 'بسيط محمد علي عبدالقادر',
          ),
          CompanyInfoItem(title: 'رقم الهاتف :', value: '+20 01098765432'),
          CompanyInfoItem(title: 'الإيميل :', value: 'w3schools@learn.org'),
          CompanyInfoItem(
            title: 'الموقع :',
            value: 'القاهرة - حي الزمالك - شارع الميرغاب',
            trailing: Image.asset(
              Assets.imagesGoogleMap,
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}
