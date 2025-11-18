import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/features/packages/presentation/manager/packages_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/api_error_widget.dart';
import '../../../../core/widgets/empty_grid_view_widget.dart';
import 'widgets/add_new_package_dialog.dart';
import 'widgets/packages_grid_view.dart';
import 'widgets/packages_view_header.dart';

class PackagesView extends StatelessWidget {
  const PackagesView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isMobile = SizeConfig.isMobile();
    return Scaffold(
      floatingActionButton: !isMobile
          ? null
          : FloatingActionButton(
              backgroundColor: AppColors.main,
              onPressed: () => addNewPackageDialog(context),
              child: const Icon(Icons.add, color: Colors.white),
            ),
      body: Consumer<PackagesProvider>(
        builder: (_, prov, _) {
          return prov.checkGettingAllPackages == false
              ? ApiErrorView(msg: prov.message, onRetry: prov.getAllPackages)
              : PackagesViewBody();
        },
      ),
    );
  }
}

class PackagesViewBody extends StatelessWidget {
  const PackagesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<PackagesProvider>();
    return Column(
      children: [
        SizedBox(height: 8),
        PackagesViewHeader(),
        SizedBox(height: 8),
        Expanded(
          child: prov.packages.isEmpty
              ? EmptyGridViewWidget(msg: 'لا يوجد باقات بعد')
              : PackagesGridView(),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
