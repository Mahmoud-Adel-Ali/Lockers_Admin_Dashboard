import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../utils/size_config.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final Widget? child;
  final Widget? leading;
  final Widget? bottomWidget;
  final BoxConstraints? constraints;

  const CustomDialog({
    super.key,
    this.title = '',
    this.message = '',
    this.child,
    this.leading,
    this.constraints,
    this.bottomWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      constraints:
          constraints ??
          BoxConstraints(
            maxWidth: SizeConfig.width * 0.9,
            maxHeight: SizeConfig.height * 0.6,
          ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.all(16),
      backgroundColor: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.close, color: Colors.black54),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const Spacer(flex: 3),
                Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.style20w700(
                      context,
                    ).copyWith(color: AppColors.purple),
                  ),
                ),
                const Spacer(flex: 3),
                leading ?? const Spacer(flex: 1),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child:
                      child ??
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.style16w400(context),
                      ),
                ),
              ),
            ),
            bottomWidget ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
