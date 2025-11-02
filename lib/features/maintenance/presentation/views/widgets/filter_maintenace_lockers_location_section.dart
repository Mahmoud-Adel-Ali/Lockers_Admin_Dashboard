import 'package:flutter/material.dart';

import '../../../../../../constants.dart';
import '../../../../../core/widgets/location_filter_button.dart';

class FilterMaintenaceLockersLocationSection extends StatefulWidget {
  const FilterMaintenaceLockersLocationSection({super.key});

  @override
  State<FilterMaintenaceLockersLocationSection> createState() =>
      _FilterMaintenaceLockersLocationSectionState();
}

class _FilterMaintenaceLockersLocationSectionState
    extends State<FilterMaintenaceLockersLocationSection> {
  int selectedCity = 0;
  int selectedRegion = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        // Cities
        SizedBox(
          height: 38,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cities.length,
            itemBuilder: (context, index) {
              return LocationFilterButton(
                title: cities[index],
                isSelected: selectedCity == index,
                onTap: () => setState(() => selectedCity = index),
              );
            },
          ),
        ),

        // Regions
        SizedBox(
          height: 38,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: regions.length,
            itemBuilder: (context, index) {
              return LocationFilterButton(
                title: regions[index],
                isSelected: selectedRegion == index,
                onTap: () => setState(() => selectedRegion = index),
              );
            },
          ),
        ),
      ],
    );
  }
}
