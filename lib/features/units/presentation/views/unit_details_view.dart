import 'package:flutter/material.dart';

import 'widgets/unit_details_view_header.dart';

class UnitDetailsView extends StatelessWidget {
  const UnitDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 8),
          UnitDetailsViewHeader(),
          //
        ],
      ),
    );
  }
}
