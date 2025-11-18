import 'dart:developer';

import 'package:geocoding/geocoding.dart' as gecode;
import 'package:google_maps_flutter/google_maps_flutter.dart';
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

  Future<LocationDetailsModel> getLocationDetails(LatLng? latLng) async {
    final loc = await getLocation();

    latLng ??= LatLng(loc.latitude!, loc.longitude!);

    final placemarks = await gecode.placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
    );

    final gecode.Placemark place = placemarks.first;
    log(place.toString());
    final locationDetailsModel = LocationDetailsModel(
      latitude: latLng.latitude,
      longitude: latLng.longitude,
      country: place.country,
      city: place.administrativeArea ?? place.locality,
      neighborhood: place.subAdministrativeArea,
      street: place.street ?? place.thoroughfare,
      postalCode: place.postalCode,
      administrativeArea: place.subLocality,
    );

    log(locationDetailsModel.toString());
    return locationDetailsModel;
  }
}

class LocationServiceException implements Exception {}

class LocationPermissionException implements Exception {}
