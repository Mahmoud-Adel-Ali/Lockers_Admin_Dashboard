import 'dart:developer';

import 'package:geocoding/geocoding.dart' as gecode;
import 'package:location/location.dart';

import '../models/location_details_model.dart';

class LocationService {
  Location location = Location();

  /// Check if location services are enabled
  Future<void> checkAndRequestLocationService() async {
    bool isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
      throw LocationServiceException();
    }
  }

  Future<void> checkAndRequestLocationPermission() async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      throw LocationPermissionException();
    } else if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        throw LocationPermissionException();
      }
    }
  }

  void getRealTimeLocationData(void Function(LocationData)? onData) async {
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    location.changeSettings(distanceFilter: 2);
    location.onLocationChanged.listen(onData);
  }

  Future<LocationData> getLocation() async {
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    final locationData = await location.getLocation();
    return locationData;
  }

  Future<LocationDetailsModel> getLocationDetails() async {
    final loc = await getLocation();

    final placemarks = await gecode.placemarkFromCoordinates(
      loc.latitude!,
      loc.longitude!,
    );

    final place = placemarks.first;

    final locationDetailsModel = LocationDetailsModel(
      latitude: loc.latitude!,
      longitude: loc.longitude!,
      country: place.country,
      city: place.locality ?? place.subAdministrativeArea,
      neighborhood: place.subLocality,
      street: place.street,
      postalCode: place.postalCode,
      administrativeArea: place.administrativeArea,
    );

    log(locationDetailsModel.toString());
    return locationDetailsModel;
  }
}

class LocationServiceException implements Exception {}

class LocationPermissionException implements Exception {}
