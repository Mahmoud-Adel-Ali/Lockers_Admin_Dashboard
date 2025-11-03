import 'package:flutter/material.dart';

import 'widgets/customers_view_header.dart';

class CustomersView extends StatelessWidget {
  const CustomersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        const CustomersViewHeader(),
        const SizedBox(height: 8),
      ],
    );
  }
}
