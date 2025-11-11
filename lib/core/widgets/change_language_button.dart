import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../generated/l10n.dart';
import '../providers/language_provider.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'custom_button.dart';
import 'dialog_helper.dart';

class ChangeLanguageButton extends StatelessWidget {
  const ChangeLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    var langProv = context.watch<LanguageProvider>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              horizontal: 0,
              color: AppColors.filedGrey,
              child: Row(
                children: [
                  Icon(Icons.language_outlined, color: AppColors.main),
                  const SizedBox(width: 8),
                  Text(
                    '${S.of(context).the_language} :',
                    style: AppTextStyles.style16w500(
                      context,
                    ).copyWith(color: AppColors.main, fontFamily: vexa),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      S.of(context).language,
                      style: AppTextStyles.style20w500(
                        context,
                      ).copyWith(color: AppColors.main, fontFamily: vexa),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                DialogHelper.showQuestionDialog(
                  context,
                  title: S.of(context).changeLanguageConfirmation,
                  desc: '',
                  btnOkText: S.of(context).ok,
                  onOk: () {
                    langProv.isArabic
                        ? langProv.toEnglish()
                        : langProv.toArabic();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );

    //  Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //   child: ProfileTextField(
    //     readOnly: true,
    //     title: '${S.of(context).the_language} :',
    //     controller: TextEditingController(text: S.of(context).language),
    //     suffixIcon: CircularButton(
    //       color: AppColors.phosphorGreen,
    //       child: const Icon(Icons.language, color: Colors.white, size: 20),
    //       onPressed: () {
    //         langProv.isArabic ? langProv.toEnglish() : langProv.toArabic();
    //       },
    //     ),
    //   ),
    // );
  }
}
