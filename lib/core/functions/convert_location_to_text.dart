import 'package:flutter/material.dart';

String convertLocationToText(
  BuildContext context, {
  String? city,
  String? neighborhood,
  String? street,
  String? buildingNum,
}) {
  String location = '';
  if (city != null) {
    location += city;
  }
  if (neighborhood != null) {
    location += ' - $neighborhood';
  }
  if (street != null) {
    location += ' - $street';
  }
  if (buildingNum != null) {
    location += ' - مبني $buildingNum';
  }
  return location;
}
