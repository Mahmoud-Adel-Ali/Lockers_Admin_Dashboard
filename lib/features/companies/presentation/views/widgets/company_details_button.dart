// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/show_loading_dialog.dart';
import '../../../../../core/functions/snack_bar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../../generated/l10n.dart';
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
          title: !isActive ? 'تفعيل الحساب' : 'الغاء التفعيل',
          desc: !isActive
              ? 'هل ترغب في تفعيل\nحساب الشركة'
              : 'هل ترغب في إيقاف تفعيل\nحساب الشركة',
          btnOkText: 'نعم',
          onOk: () async {
            //* Show Loading Dialog
            showLoadingDialog(context);

            await prov.updateCompanyStatus();

            //* Close Loading Dialog
            Navigator.pop(context);

            if (prov.checkUpdateCompanyStatus == true) {
              showSuccessSnackBar(context, msg: prov.message);
            } else if (prov.checkUpdateCompanyStatus == false) {
              DialogHelper.showErrorDialog(
                context,
                title: S.of(context).error,
                desc: prov.message,
              );
            }
          },
        );
      },
    );
  }
}
