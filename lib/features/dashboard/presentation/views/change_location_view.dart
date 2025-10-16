import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/arrow_back_icon.dart';
import '../../../../core/widgets/custom_button.dart';
import 'widgets/change_locatioin_bottom_sheet.dart';

class ChangeLocationView extends StatelessWidget {
  const ChangeLocationView({super.key});
  static const routeName = '/changeLocationView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesTestMapImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ArrowBackIcon(),
                CustomButton(
                  onPressed: () => changeLocationDetailsBottomSheet(context),
                  color: AppColors.main,
                  text: 'عرض الموقع',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
