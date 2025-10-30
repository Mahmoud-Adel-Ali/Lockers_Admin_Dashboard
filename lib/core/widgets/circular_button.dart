import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    super.key,
    required this.child,
    this.color = AppColors.white,
    this.onPressed,
  });
  final Widget child;
  final VoidCallback? onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      shape: CircleBorder(),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey),
          color: color,
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}
