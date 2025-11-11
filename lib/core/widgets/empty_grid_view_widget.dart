import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_text_styles.dart';
import '../utils/assets.dart';

class EmptyGridViewWidget extends StatelessWidget {
  const EmptyGridViewWidget({super.key, this.msg = 'لا يوجد بيانات لعرضها'});
  final String msg;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(Assets.animationsEmptyGrid),
          const SizedBox(height: 24),
          Text(msg, style: AppTextStyles.style20w700(context)),
        ],
      ),
    );
  }
}
