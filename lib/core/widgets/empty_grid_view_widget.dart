import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_text_styles.dart';
import '../utils/assets.dart';

class EmptyGridViewWidget extends StatelessWidget {
  const EmptyGridViewWidget({
    super.key,
    this.lottiePath,
    this.msg = 'لا يوجد بيانات لعرضها',
  });

  final String msg;
  final String? lottiePath;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Lottie.asset(
            lottiePath ?? Assets.animationsEmptyGrid2,
            repeat: false,
            height: 300,
          ),
          const SizedBox(height: 24),
          Text(msg, style: AppTextStyles.style20w700(context)),
        ],
      ),
    );
  }
}
