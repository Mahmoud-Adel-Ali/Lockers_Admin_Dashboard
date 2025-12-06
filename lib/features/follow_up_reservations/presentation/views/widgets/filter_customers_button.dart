import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/is_arabic.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_popup_menu_button.dart';
import '../../../data/enum/unit_customer_type.dart';
import '../../manager/reservations_provider.dart';

class FilterCustomersButton extends StatelessWidget {
  const FilterCustomersButton({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ReservationsProvider>();
    // List of filter options
    final List<UnitCustomerType> items = [
      UnitCustomerType.all,
      UnitCustomerType.appClients,
      UnitCustomerType.shippingCompanies,
    ];

    return CustomPopupMenuButton<UnitCustomerType>(
      key: const Key('filter_button'),
      items: items,
      initialValue: prov.unitCustomerType,
      itemLabelBuilder: (item) => isArabic() ? item.arName : item.enName,
      backgroundColor: AppColors.whiteGrey,
      textStyle: AppTextStyles.style16w400(context),
      onSelected: (index) {
        prov.filterUnitOrders(type: items[index]);
      },
    );
  }
}
