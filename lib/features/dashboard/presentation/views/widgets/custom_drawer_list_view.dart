import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/dashboard_model.dart';
import '../../manager/dashboard_manager.dart';
import 'custom_drawer_item.dart';

class CustomDrawerListView extends StatelessWidget {
  const CustomDrawerListView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<DashboardManager>();
    return ListView.builder(
      itemCount: adminFeaturesList.length,
      itemBuilder: (context, index) {
        DashboardModel item = adminFeaturesList[index];
        return CustomDrawerItem(
          item: item,
          isSelected: itemIsSelected(item, prov),
          onTap: () {
            if (itemIsSelected(item, prov)) return;
            prov.changeView(item.type);
            if (prov.isDrawerOpen()) prov.closeDrawer();
          },
        );
      },
    );
  }

  bool itemIsSelected(DashboardModel item, DashboardManager prov) {
    return item.type == prov.type || item.relatedTypes.contains(prov.type);
  }
}
