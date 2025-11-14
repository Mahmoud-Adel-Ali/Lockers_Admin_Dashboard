import 'package:flutter/material.dart';

String convertLocationToText(
  BuildContext context, {
  String? city,
  String? neighborhood,
  String? street,
  String? buildingNum,
}) {
  String location = '';
  if (city != null && city.isNotEmpty) {
    location += city;
  }
  if (neighborhood != null && neighborhood.isNotEmpty) {
    location += ' - $neighborhood';
  }
  if (street != null && street.isNotEmpty) {
    location += ' - $street';
  }
  if (buildingNum != null && buildingNum.isNotEmpty) {
    location += ' - مبني $buildingNum';
  }
  return location;
}
