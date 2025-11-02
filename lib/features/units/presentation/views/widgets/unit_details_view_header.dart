import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/dashboard_back_button.dart';
import '../../../../dashboard/data/enums/dashboard_type.dart';
import '../../../../dashboard/presentation/manager/dashboard_manager.dart';
import 'add_locker_button.dart';

class UnitDetailsViewHeader extends StatelessWidget {
  const UnitDetailsViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var read = context.read<DashboardManager>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DashboardBackIcon(
          onPressed: () {
            read.changeView(DashboardType.Units);
          },
        ),
        AddLockerButton(),
      ],
    );
  }
}
