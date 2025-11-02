import 'package:flutter/material.dart';

import 'maintenance_locker_card.dart';

class MaintenanceLockersGridView extends StatelessWidget {
  const MaintenanceLockersGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //* meaning that the minwidth of the card is 210.
            crossAxisCount: (width / 210).toInt(),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 200 / 250,
            mainAxisExtent: 200,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return MaintenanceLockerCard();
          },
        );
      },
    );
  }
}
