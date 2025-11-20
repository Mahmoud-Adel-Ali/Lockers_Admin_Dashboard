import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart' as geocode;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../models/location_details_model.dart';

class LocationService {
  Location location = Location();

  /// Request permission ONLY on mobile/desktop
  Future<void> checkAndRequestLocationPermission() async {
    if (kIsWeb) return; // ❗ Web: SKIP permissions completely

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

  /// Check if location services are enabled (mobile only)
  Future<void> checkAndRequestLocationService() async {
    if (kIsWeb) return; // ❗ Web: SKIP service checks

    bool isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) throw LocationServiceException();
    }
  }

  /// Get device GPS location (mobile/desktop only)
  Future<LocationData?> getLocation() async {
    if (kIsWeb) return null;
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    return await location.getLocation();
  }

  /// Web-safe method to get reverse geocoding
  Future<LocationDetailsModel> getLocationDetails(LatLng? latLng) async {
    LatLng finalLatLng = latLng ?? LatLng(27.5042, 30.7202); // Default Egypt

    // ❗ On mobile, if latLng is null → get GPS
    if (!kIsWeb && latLng == null) {
      final loc = await getLocation();
      if (loc != null) {
        finalLatLng = LatLng(loc.latitude!, loc.longitude!);
      }
    }

    // Reverse geocoding
    final placemarks = await geocode.placemarkFromCoordinates(
      finalLatLng.latitude,
      finalLatLng.longitude,
    );

    final place = placemarks.first;

    return LocationDetailsModel(
      latitude: finalLatLng.latitude,
      longitude: finalLatLng.longitude,
      country: place.country,
      city: place.administrativeArea ?? place.locality,
      neighborhood: place.subAdministrativeArea,
      street: place.street ?? place.thoroughfare,
      postalCode: place.postalCode,
      administrativeArea: place.subLocality,
    );
  }
}

class LocationServiceException implements Exception {}

class LocationPermissionException implements Exception {}
