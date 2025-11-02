import 'package:flutter/material.dart';

import 'maintenance_unit_card.dart';

class MaintenanceUnitsGridView extends StatelessWidget {
  const MaintenanceUnitsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //* meaning that the minwidth of the card is 180.
            crossAxisCount: (width / 180).toInt(),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 198.5 / 250,
            mainAxisExtent: 200,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return MaintenanceUnitCard();
          },
        );
      },
    );
  }
}
