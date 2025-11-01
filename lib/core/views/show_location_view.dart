import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/assets.dart';
import '../widgets/arrow_back_icon.dart';
import '../widgets/custom_button.dart';
import 'widgets/show_locatioin_bottom_sheet.dart';

class ShowLocationView extends StatelessWidget {
  const ShowLocationView({super.key});
  static const routeName = '/ShowLocationView';

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
                  onPressed: () => showLocationDetailsBottomSheet(context),
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
