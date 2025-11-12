// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../generated/l10n.dart';
import '../models/location_details_model.dart';
import '../services/location_service.dart';
import '../widgets/arrow_back_icon.dart';
import '../widgets/custom_button.dart';
import '../widgets/dialog_helper.dart';
import 'widgets/pick_location_bottom_sheet.dart';

class PickLocationView extends StatefulWidget {
  const PickLocationView({super.key});
  static const routeName = 'PickCompanyLocation';

  @override
  State<PickLocationView> createState() => _PickLocationViewState();
}

class _PickLocationViewState extends State<PickLocationView> {
  bool isLoading = true;
  LocationDetailsModel? locationDetailsModel;

  late CameraPosition initialCameraPosition;
  late LocationService locationService;
  late GoogleMapController mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    // Egypt initial position
    var latLng = LatLng(27.504233709174983, 30.720281847535116);

    initialCameraPosition = CameraPosition(target: latLng, zoom: 10);
    locationService = LocationService();
  }

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
    markers.clear();
    locationDetailsModel = null;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialCameraPosition,
            markers: markers,
            zoomControlsEnabled: false,
            onMapCreated: (controller) {
              mapController = controller;
              updateLocation();
            },
            onTap: (latLng) {
              // Update marker to new position
              setLocationMarker(latLng);
              // Update model values
              locationDetailsModel = LocationDetailsModel(
                latitude: latLng.latitude,
                longitude: latLng.longitude,
              );
            },
          ),

          PickLocationViewBody(
            isLoading: isLoading,
            locationModel: locationDetailsModel,
          ),
        ],
      ),
    );
  }

  void updateLocation() async {
    try {
      var locationData = await locationService.getLocationDetails();
      locationDetailsModel = locationData;

      var latLng = LatLng(locationData.latitude, locationData.longitude);
      log("New latLng: ${latLng.toString()}");
      setLocationMarker(latLng);

      var cameraPosition = CameraPosition(target: latLng, zoom: 16);
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(cameraPosition),
      );
    } on LocationServiceException catch (e) {
      log("LocationServiceException $e");
      Navigator.pop(context);
      DialogHelper.showErrorDialog(
        context,
        title: S.of(context).location_service_error_title,
        desc: S.of(context).location_service_error_desc,
      );
    } on LocationPermissionException catch (e) {
      log("LocationPermissionException $e");
      Navigator.pop(context);
      DialogHelper.showErrorDialog(
        context,
        title: S.of(context).location_permission_error_title,
        desc: S.of(context).location_permission_error_desc,
      );
    } catch (e) {
      log("Exception $e");
      Navigator.pop(context);
      DialogHelper.showErrorDialog(context, title: "Exception", desc: "$e");
    }

    isLoading = false;
    setState(() {});
  }

  void setLocationMarker(LatLng latLng) {
    var myLocationMarker = Marker(
      markerId: const MarkerId('Your Location'),
      position: latLng,
      infoWindow: const InfoWindow(title: 'Your Location'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    );

    markers = {myLocationMarker};
    if (mounted) setState(() {});
  }
}

class PickLocationViewBody extends StatelessWidget {
  const PickLocationViewBody({
    super.key,
    required this.isLoading,
    required this.locationModel,
  });
  final bool isLoading;
  final LocationDetailsModel? locationModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(children: [ArrowBackIcon()]),
        ),
        const Spacer(),
        if (isLoading) Center(child: const CircularProgressIndicator()),
        if (!isLoading)
          CustomButton(
            text: 'حفظ',
            onPressed: () {
              // Open bottom sheet to complete details
              pickLocationDetailsBottomSheet(
                context,
                locationModel: locationModel!,
              );
            },
          ),
        SizedBox(height: 16),
      ],
    );
  }
}
