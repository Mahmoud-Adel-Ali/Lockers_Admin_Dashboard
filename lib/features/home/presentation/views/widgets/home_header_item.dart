import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../data/models/home_header_item_model.dart';

class HomeHeaderItem extends StatelessWidget {
  const HomeHeaderItem({super.key, this.flex = 1, required this.item});
  final HomeHeaderItemModel item;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: SizedBox(
        // height: 100,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: item.color,
            child: SvgPicture.asset(item.icon),
          ),
          title: Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.style20w700(
              context,
            ).copyWith(fontFamily: poppins),
          ),
          subtitle: Text(
            item.subtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.style12w400(
              context,
            ).copyWith(fontFamily: almarai),
          ),
        ),
      ),
    );
  }
}
