import 'package:flutter/material.dart';

import 'widgets/home_view_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 8),
        HomeViewHeader(),
        SizedBox(height: 8),
        //
      ],
    );
  }
}
