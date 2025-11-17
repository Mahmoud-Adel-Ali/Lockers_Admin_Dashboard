import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/is_arabic.dart';
import '../../../../../core/widgets/custom_popup_menu_button.dart';
import '../../../data/enums/customer_type.dart';
import '../../manager/customers_provider.dart';

class CustomersSelectorField extends StatelessWidget {
  const CustomersSelectorField({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<CustomersProvider>();

    final List<CustomerType> items = [
      CustomerType.all,
      CustomerType.system,
      CustomerType.newCustomers,
      CustomerType.blocked,
    ];

    return CustomPopupMenuButton<CustomerType>(
      items: items,
      initialValue: prov.customerType,
      itemLabelBuilder: (item) => isArabic() ? item.arName : item.enName,
      onSelected: (index) {
        prov.onChangeCustomerType(items[index]);
      },
    );
  }
}
