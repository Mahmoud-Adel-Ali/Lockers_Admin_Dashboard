import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../utils/assets.dart';

class ShowLocationContainer extends StatelessWidget {
  const ShowLocationContainer({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.whiteGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: AppTextStyles.style16w500(context)),
          SizedBox(
            width: 20,
            height: 20,
            child: Image.asset(Assets.imagesGoogleMap),
          ),
        ],
      ),
    );
  }
}
