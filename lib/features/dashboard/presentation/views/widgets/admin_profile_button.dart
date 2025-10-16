import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import 'profile_data_dialog.dart';

class AdminProfileButton extends StatelessWidget {
  const AdminProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => profileDataDialog(context),
      padding: EdgeInsets.all(10),
      height: 40,
      elevation: 0,
      color: AppColors.babyBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(42)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(Assets.imagesAppLogo),
          ),
          const SizedBox(width: 16),
          SvgPicture.asset(Assets.imagesSettingsIcon, width: 22, height: 22),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
