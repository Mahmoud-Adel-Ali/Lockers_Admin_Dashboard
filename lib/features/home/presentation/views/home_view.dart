import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';
import 'widgets/home_view_header.dart';
import 'widgets/lockers_indecator.dart';
import 'widgets/units_indecator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 8),
          const HomeViewHeader(),
          const SizedBox(height: 8),
          // [Units & Lockers] Circle-Percent-Indicator
          SizeConfig.isMobile()
              ? Column(
                  spacing: 8,
                  children: [UnitsIndecator(), LockersIndecator()],
                )
              : Row(
                  spacing: 8,
                  children: [
                    Expanded(child: UnitsIndecator()),
                    Expanded(child: LockersIndecator()),
                  ],
                ),
        ],
      ),
    );
  }
}
