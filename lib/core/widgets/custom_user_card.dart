import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/widgets/custom_cached_network_image.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomUserCard extends StatelessWidget {
  const CustomUserCard({
    super.key,
    required this.name,
    required this.phone,
    this.assetsImage,
    this.imgUrl,
    this.onTap,
  });
  final String name;
  final String phone;
  final String? assetsImage;
  final String? imgUrl;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            const Spacer(flex: 2),
            if (imgUrl != null)
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: customCachedNetworkImageprovider(imgUrl),
                ),
              ),
            if (assetsImage != null)
              CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage(assetsImage!),
              ),
            const Spacer(flex: 2),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.style20w500(context),
            ),
            const SizedBox(height: 8),
            Text(
              phone,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.style16w400(context),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
