import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import 'widgets/employees_view_header.dart';

class EmployeesView extends StatelessWidget {
  const EmployeesView({super.key});

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
          const SizedBox(height: 8),
          EmployeesViewHeader(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
