import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class PaginationControls extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final bool hasNext;
  final bool hasPrevious;

  const PaginationControls({
    super.key,
    required this.onNext,
    required this.onPrevious,
    required this.hasNext,
    required this.hasPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 16,
      left: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Previous Button
          ElevatedButton(
            onPressed: hasPrevious ? onPrevious : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.red,
              foregroundColor: AppColors.black,
              elevation: 4,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: hasPrevious ? Colors.black12 : Colors.grey.shade300,
                ),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios, size: 18),
                SizedBox(width: 8),
                Text("السابق", style: AppTextStyles.style16w500(context)),
              ],
            ),
          ),

          // Next Button
          ElevatedButton(
            onPressed: hasNext ? onNext : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.glowWhiteGreen,
              foregroundColor: AppColors.black,
              elevation: 4,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: hasNext ? Colors.black12 : Colors.grey.shade300,
                ),
              ),
            ),
            child: Row(
              children: [
                Text("التالي", style: AppTextStyles.style16w500(context)),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward_ios, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
