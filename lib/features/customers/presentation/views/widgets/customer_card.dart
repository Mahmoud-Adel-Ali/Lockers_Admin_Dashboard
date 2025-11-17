import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../data/enums/customer_type.dart';
import '../../../data/models/customer_model.dart';
import 'blocked_customers_button.dart';
import 'new_customers_button.dart';
import 'show_customer_data_dialog.dart';
import 'system_customers_button.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({super.key, required this.customer});
  final CustomerModel customer;

  @override
  Widget build(BuildContext context) {
    var type = customer.status;
    return InkWell(
      onTap: () => showCustomerDataDialog(context),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: customCachedNetworkImageprovider(
                    customer.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              customer.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.style18w400(context),
            ),
            // const SizedBox(height: 8),
            Text(
              customer.phone,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.style16w400(context),
            ),
            const SizedBox(height: 8),
            if (type == CustomerType.system)
              SystemCustomersButton(customer: customer),
            if (type == CustomerType.blocked)
              BlockedCustomersButton(customer: customer),
            if (type == CustomerType.newCustomers)
              NewCustomersButton(customer: customer),
          ],
        ),
      ),
    );
  }
}
