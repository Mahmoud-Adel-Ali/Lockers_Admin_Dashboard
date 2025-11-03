import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../data/enums/customer_type.dart';
import 'customers_blocked_button.dart';
import 'customers_new_button.dart';
import 'customers_system_button.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({super.key, required this.type});
  final CustomerType type;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            const Spacer(flex: 2),
            CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage(Assets.imagesTestUserImage),
            ),
            const Spacer(flex: 2),
            Text(
              'MOHAMED ALI',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.style20w500(context),
            ),
            const SizedBox(height: 8),
            Text(
              '020 123 4567 258',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.style16w400(context),
            ),
            const Spacer(flex: 2),
            if (type == CustomerType.system) CustomersSystemButton(),
            if (type == CustomerType.blocked) CustomersBlockedButton(),
            if (type == CustomerType.newCustomers) CustomersNewButton(),
          ],
        ),
      ),
    );
  }
}
