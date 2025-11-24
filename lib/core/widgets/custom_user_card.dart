import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/widgets/custom_cached_network_image.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomUserCard extends StatelessWidget {
  const CustomUserCard({
    super.key,
    required this.name,
    required this.phone,
    this.imgUrl,
    this.onTap,
  });
  final String name;
  final String phone;
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
            SizedBox(height: 12),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: customCachedNetworkImageprovider(imgUrl),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 12),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.style20w500(context),
            ),
            // const SizedBox(height: 8),
            Text(
              phone,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.style16w400(context),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
