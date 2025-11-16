import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../utils/assets.dart';

class CustomProgressHub extends StatelessWidget {
  const CustomProgressHub({
    super.key,
    required this.isLoading,
    required this.child,
  });
  final bool isLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: LoadingIconWidget(),
      inAsyncCall: isLoading,
      child: child,
    );
  }
}

class LoadingIconWidget extends StatelessWidget {
  const LoadingIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Lottie.asset(Assets.animationsLoadingLottie),
    );
  }
}
