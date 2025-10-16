import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../functions/is_arabic.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';

class ArrowBackIcon extends StatelessWidget {
  const ArrowBackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: isArabic() ? 3.14 : 0,
      child: InkWell(
        onTap: () => Navigator.of(context).pop(),
        borderRadius: BorderRadius.circular(50),
        child: CircleAvatar(
          backgroundColor: AppColors.white,
          child: SvgPicture.asset(Assets.imagesArrowBackIcon),
        ),
      ),
    );
  }
}
