import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_text_button.dart';

class ResentOtpWidget extends StatefulWidget {
  const ResentOtpWidget({super.key});

  @override
  State<ResentOtpWidget> createState() => _ResentOtpWidgetState();
}

class _ResentOtpWidgetState extends State<ResentOtpWidget> {
  int seconds = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds == 0) {
        timer.cancel();
      } else {
        seconds--;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (seconds == 0)
          CustomTextButton(
            title: 'إعادة إرسال الكود !',
            onTap: () async {
              // Restart the timer
              seconds = 60;
              setState(() {});
              startCountdown();

              // Re-send the code
              // await context.read<AuthProvider>().forgetPassword();
            },
          )
        else
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextButton(title: 'انتظر $seconds ثانية', onTap: () {}),
              Text(
                'لكي تستطيع إعادة إرسال الكود',
                style: AppTextStyles.style12w400(
                  context,
                ).copyWith(color: AppColors.main),
              ),
            ],
          ),
      ],
    );
  }
}
