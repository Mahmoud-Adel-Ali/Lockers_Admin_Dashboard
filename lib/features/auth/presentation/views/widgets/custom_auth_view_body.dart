import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/arrow_back_icon.dart';
import '../../../../../core/widgets/custom_progress_hub.dart';

class CustomAuthViewBody extends StatelessWidget {
  const CustomAuthViewBody({
    super.key,
    required this.image,
    required this.title,
    required this.form,
    this.showArrow = true,
    this.isLoading = false,
  });
  final String image;
  final bool showArrow;
  final String title;
  final Widget form;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isMobile = SizeConfig.isMobile();
    return CustomProgressHub(
      isLoading: isLoading,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            if (!isMobile)
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Image.asset(
                      image,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    if (showArrow)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ArrowBackIcon(),
                      ),
                  ],
                ),
              ),
            //form
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Row(
                    children: [
                      if (showArrow && isMobile)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ArrowBackIcon(),
                        ),
                      const Spacer(),
                      Image.asset(Assets.imagesLogo),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        Text(
                          title,
                          style: AppTextStyles.style40w400(
                            context,
                          ).copyWith(color: AppColors.main, fontFamily: vexa),
                        ),
                        SizedBox(height: 24),
                        Expanded(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 400),
                            child: form,
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
