import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/location_filter_button.dart';
import '../../manager/maintenance_provider.dart';

class FilterMaintenaceLockersLocationSection extends StatelessWidget {
  const FilterMaintenaceLockersLocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<MaintenanceProvider>();
    var cities = prov.regionsOfMaintenanceLockers;
    var neighborhoods = cities.isEmpty
        ? []
        : cities[prov.selectedLockersCity].neighborhoods;
    return cities.isEmpty
        ? Center(child: Text('لا يوجد مدن'))
        : Column(
            spacing: 8,
            children: [
              // Cities
              SizedBox(
                height: 38,
                child: Skeletonizer(
                  enabled: prov.checkGetRegionsOfMaintenanceLockers == null,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: LocationFilterButton(
                          title: cities[index].city,
                          isSelected: prov.selectedLockersCity == index,
                          onTap: () => prov.changeLockersCity(index),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Regions
              if (neighborhoods.isNotEmpty)
                SizedBox(
                  height: 38,
                  width: SizeConfig.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 8),
                        LocationFilterButton(
                          title: 'الكل',
                          isSelected: prov.selectedLockersRegion == -1,
                          onTap: () => prov.changeLockersRegion(-1),
                        ),
                        SizedBox(width: 8),
                        SizedBox(
                          height: 38,
                          child: Skeletonizer(
                            enabled:
                                prov.checkGetRegionsOfMaintenanceLockers ==
                                null,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: neighborhoods.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: LocationFilterButton(
                                    title: neighborhoods[index],
                                    isSelected:
                                        prov.selectedLockersRegion == index,
                                    onTap: () =>
                                        prov.changeLockersRegion(index),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
  }
}
