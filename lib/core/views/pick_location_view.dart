import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/location_details_model.dart';
import '../services/location_service.dart';
import '../widgets/arrow_back_icon.dart';
import '../widgets/custom_button.dart';
import '../widgets/dialog_helper.dart';
import 'widgets/pick_location_bottom_sheet.dart';

class PickLocationView extends StatefulWidget {
  const PickLocationView({super.key, this.lastLocationModel});
  final LocationDetailsModel? lastLocationModel;

  @override
  State<PickLocationView> createState() => _PickLocationViewState();
}

class _PickLocationViewState extends State<PickLocationView> {
  late CameraPosition initialPosition;
  late GoogleMapController mapController;

  LocationDetailsModel? locationDetailsModel;
  Set<Marker> markers = {};
  bool isLoading = true;

  final locationService = LocationService();

  @override
  void initState() {
    super.initState();

    if (widget.lastLocationModel == null) {
      initialPosition = CameraPosition(
        target: LatLng(27.5042, 30.7202), // Egypt default
        zoom: 10,
      );
    } else {
      final latLng = LatLng(
        widget.lastLocationModel!.latitude,
        widget.lastLocationModel!.longitude,
      );
      initialPosition = CameraPosition(target: latLng, zoom: 16);

      locationDetailsModel = widget.lastLocationModel;
      setLocationMarker(latLng);
      isLoading = false;
    }
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  void setLocationMarker(LatLng latLng) {
    markers = {Marker(markerId: const MarkerId("picked"), position: latLng)};
    setState(() {});
  }

  Future<void> updateLocation({LatLng? newLatLng}) async {
    setState(() => isLoading = true);

    try {
      final data = await locationService.getLocationDetails(newLatLng);
      locationDetailsModel = data;

      final latLng = LatLng(data.latitude, data.longitude);
      setLocationMarker(latLng);

      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: 16),
        ),
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      DialogHelper.showErrorDialog(context, title: "Error", desc: "$e");
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialPosition,
            markers: markers,
            zoomControlsEnabled: false,
            onMapCreated: (controller) {
              mapController = controller;

              if (widget.lastLocationModel == null) {
                updateLocation(); // Uses GPS for mobile, not for web
              }
            },
            onTap: (latLng) => updateLocation(newLatLng: latLng),
          ),

          PickLocationViewBody(
            isLoading: isLoading,
            locationModel: locationDetailsModel,
          ),
        ],
      ),
    );
  }
}

class PickLocationViewBody extends StatelessWidget {
  const PickLocationViewBody({
    super.key,
    required this.isLoading,
    this.locationModel,
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
