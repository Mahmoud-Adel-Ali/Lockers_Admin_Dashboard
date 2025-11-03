import 'package:flutter/material.dart';

import 'widgets/complaints_grid_view.dart';
import 'widgets/complaints_view_header.dart';

class ComplaintsView extends StatelessWidget {
  const ComplaintsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 8),
          const ComplaintsViewHeader(),
          const SizedBox(height: 8),
          Expanded(child: ComplaintsGridView()),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
