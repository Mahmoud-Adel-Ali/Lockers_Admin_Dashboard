import 'package:flutter/material.dart';

import 'widgets/complaints_view_header.dart';

class ComplaintsView extends StatelessWidget {
  const ComplaintsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        const SizedBox(),
        const ComplaintsViewHeader(),
        Expanded(child: Container()),
        const SizedBox(),
      ],
    );
  }
}
