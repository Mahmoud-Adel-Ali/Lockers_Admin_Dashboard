import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import 'widgets/agreements_view_header.dart';

class AgreementsView extends StatelessWidget {
  const AgreementsView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isMobile = SizeConfig.isMobile();
    return Scaffold(
      floatingActionButton: !isMobile
          ? null
          : FloatingActionButton(
              backgroundColor: AppColors.main,
              onPressed: () {},
              child: const Icon(Icons.add, color: Colors.white),
            ),
      body: Column(
        children: [
          SizedBox(height: 8),
          AgreementsViewHeader(),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
