import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../functions/is_arabic.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';
import 'circular_button.dart';

class DashboardBackIcon extends StatelessWidget {
  const DashboardBackIcon({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CircularButton(
      onPressed: onPressed,
      color: AppColors.babyBlue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Transform.rotate(
          angle: isArabic() ? 3.14 : 0,
          child: SvgPicture.asset(Assets.imagesArrowBackIcon),
        ),
      ),
    );
  }
}
