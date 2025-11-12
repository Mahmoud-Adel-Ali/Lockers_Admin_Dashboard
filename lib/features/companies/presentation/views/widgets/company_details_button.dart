import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../data/models/company_model.dart';
import '../../manager/companies_provider.dart';

class CompanyDetailsButton extends StatelessWidget {
  const CompanyDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<CompaniesProvider>();
    CompanyModel? company = prov.companyDetails;
    bool isActive = company?.isActive ?? false;
    return CustomButton(
      text: isActive ? 'إلغاء تفعيل الحساب' : 'تفعيل الحساب',
      color: isActive ? AppColors.red : AppColors.main,
      onPressed: () {
        DialogHelper.showQuestionDialog(
          context,
          title: 'الغاء التفعيل',
          desc: 'هل ترغب في إيقاف تفعيل\nحساب الشركة',
          btnOkText: 'نعم',
          onOk: () {
            DialogHelper.showSuccessDialog(
              context,
              title: 'تم',
              desc: 'تم الغاء التفعيل بنجاح',
            );
          },
        );
      },
    );
  }
}
