import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/api_error_widget.dart';
import '../manager/customers_provider.dart';
import 'widgets/customers_grid_view.dart';
import 'widgets/customers_view_header.dart';

class CustomersView extends StatelessWidget {
  const CustomersView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<CustomersProvider>();
    return prov.checkGetAllCustomers == false
        ? ApiErrorView(msg: prov.message, onRetry: prov.getAllCustomers)
        : Column(
            children: const [
              SizedBox(height: 8),
              CustomersViewHeader(),
              SizedBox(height: 8),
              Expanded(child: CustomersGridView()),
              SizedBox(height: 8),
            ],
          );
  }
}
