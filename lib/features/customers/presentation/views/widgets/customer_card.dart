import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../data/enums/customer_type.dart';
import 'blocked_customers_button.dart';
import 'new_customers_button.dart';
import 'show_customer_data_dialog.dart';
import 'system_customers_button.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({super.key, required this.type});
  final CustomerType type;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showCustomerDataDialog(context),
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
            if (type == CustomerType.system) SystemCustomersButton(),
            if (type == CustomerType.blocked) BlockedCustomersButton(),
            if (type == CustomerType.newCustomers) NewCustomersButton(),
          ],
        ),
      ),
    );
  }
}
