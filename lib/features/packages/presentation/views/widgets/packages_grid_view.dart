import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../data/models/package_model.dart';
import '../../manager/packages_provider.dart';
import 'package_card.dart';

class PackagesGridView extends StatelessWidget {
  const PackagesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<PackagesProvider>();
    List<PackageModel> packages = prov.packages;
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        return Skeletonizer(
          enabled: prov.checkGettingAllPackages == null,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //* meaning that the minwidth of the card is 180.
              crossAxisCount: (width / 180).toInt(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 180 / 250,
              mainAxisExtent: 180,
            ),
            itemCount: packages.length,
            itemBuilder: (context, index) {
              return PackageCard(package: packages[index]);
            },
          ),
        );
      },
    );
  }
}
