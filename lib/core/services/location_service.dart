import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart' as geocode;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../models/location_details_model.dart';

class LocationService {
  Location location = Location();

  Future<LocationDetailsModel> getLocationDetails(LatLng? latLng) async {
    // ------------------------------
    // 🔥 WEB MODE
    // ------------------------------
    if (kIsWeb) {
      if (latLng == null) {
        throw Exception("Tap on the map to pick a location.");
      }

      final placemarks = await geocode.GeocodingPlatform.instance
          ?.placemarkFromCoordinates(latLng.latitude, latLng.longitude);

      final place = placemarks?.isNotEmpty ?? false
          ? placemarks!.first
          : geocode.Placemark();
      log("Place Info : $place");
      var locationDetailsModel = LocationDetailsModel(
        latitude: latLng.latitude,
        longitude: latLng.longitude,
        country: place.country ?? '',
        city: place.locality ?? place.administrativeArea ?? "",
        neighborhood: place.subLocality ?? "",
        street: place.street ?? place.thoroughfare ?? "",
      );

      log("Location Details : ${locationDetailsModel.toString()}");
      return locationDetailsModel;
    }

    // ------------------------------
    // 🔥 MOBILE MODE
    // ------------------------------
    await _checkService();
    await _checkPermission();

    Location location = Location();
    LocationData? loc = await location.getLocation();

    final target = LatLng(
      latLng?.latitude ?? loc.latitude!,
      latLng?.longitude ?? loc.longitude!,
    );

    final placemarks = await geocode.GeocodingPlatform.instance
        ?.placemarkFromCoordinates(target.latitude, target.longitude);
    final place = placemarks?.isNotEmpty ?? false
        ? placemarks!.first
        : geocode.Placemark();

    var locationDetailsModel2 = LocationDetailsModel(
      latitude: target.latitude,
      longitude: target.longitude,
      country: place.country ?? '',
      city: place.locality ?? place.administrativeArea ?? "",
      neighborhood: place.subLocality ?? "",
      street: place.street ?? place.thoroughfare ?? "",
    );

    log("Location Details : ${locationDetailsModel2.toString()}");
    return locationDetailsModel2;
  }

  Future<void> _checkService() async {
    bool enabled = await location.serviceEnabled();
    if (!enabled) {
      enabled = await location.requestService();
      if (!enabled) throw Exception("Location service disabled.");
    }
  }

  Future<void> _checkPermission() async {
    PermissionStatus status = await location.hasPermission();
    if (status == PermissionStatus.denied) {
      status = await location.requestPermission();
    }
    if (status != PermissionStatus.granted) {
      throw Exception("Location permission denied.");
    }
  }
}
