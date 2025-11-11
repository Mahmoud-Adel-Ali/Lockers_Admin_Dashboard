import 'package:flutter/material.dart';

import 'package_card.dart';

class PackagesGridView extends StatelessWidget {
  const PackagesGridView({super.key});

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
            childAspectRatio: 180 / 250,
            mainAxisExtent: 180,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return PackageCard();
          },
        );
      },
    );
  }
}
