import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/company_dashboard_model.dart';
import '../../manager/dashboard_manager.dart';
import 'filter_button.dart';

class DashboardFeaturesButtons extends StatelessWidget {
  const DashboardFeaturesButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardManager>(
      builder: (_, prov, _) => Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(adminFeaturesList.length, (index) {
          DashboardModel item = adminFeaturesList[index];
          return Expanded(
            flex: item.title.length > 10 ? 5 : 4,
            child: FilterButton(
              title: item.title,
              activeIcon: item.activeIcon,
              inactiveIcon: item.inactiveIcon,
              isSelected: itemIsSelected(item, prov),
              onTap: () {
                if (itemIsSelected(item, prov)) return;
                prov.changeView(item.type);
              },
            ),
          );
        }),
      ),
    );
  }

  bool itemIsSelected(DashboardModel item, DashboardManager prov) {
    return item.type == prov.type || item.relatedTypes.contains(prov.type);
  }
}
