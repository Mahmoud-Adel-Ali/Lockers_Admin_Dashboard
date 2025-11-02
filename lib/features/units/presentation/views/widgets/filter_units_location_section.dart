import 'package:flutter/material.dart';

import '../../../../../../constants.dart';
import '../../../../../core/widgets/location_filter_button.dart';

class FilterUnitsLocationSection extends StatefulWidget {
  const FilterUnitsLocationSection({super.key});

  @override
  State<FilterUnitsLocationSection> createState() =>
      _FilterUnitsLocationSectionState();
}

class _FilterUnitsLocationSectionState
    extends State<FilterUnitsLocationSection> {
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
