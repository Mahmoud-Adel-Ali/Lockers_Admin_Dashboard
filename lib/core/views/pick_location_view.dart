import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/location_details_model.dart';
import '../services/location_service.dart';
import '../widgets/dialog_helper.dart';
import 'widgets/pick_location_bottom_sheet.dart';
import 'widgets/pick_location_view_body.dart';

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
  bool? isLoading;
  bool isBottomSheetOpen = false;

  final locationService = LocationService();

  @override
  void initState() {
    super.initState();

    if (widget.lastLocationModel == null) {
      initialPosition = CameraPosition(
        target: LatLng(27.5042, 30.7202), // Egypt default
        zoom: 12,
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

              if (widget.lastLocationModel == null && !kIsWeb) {
                updateLocation(); // Uses GPS for mobile, not for web
              }
            },
            onTap: isBottomSheetOpen
                ? null
                : (latLng) => updateLocation(newLatLng: latLng).then((value) {
                    if (kIsWeb) {
                      // ignore: use_build_context_synchronously
                      showBottomSheet(context);
                    }
                  }),
          ),

          // 🔥 ADD THIS OVERLAY
          if (isBottomSheetOpen)
            Positioned.fill(
              child: Container(
                color: Colors.transparent, // invisible but blocks taps
              ),
            ),
          if (!kIsWeb)
            PickLocationViewBody(
              isLoading: isLoading,
              onTabNext: () async {
                await showBottomSheet(context);
              },
            ),
        ],
      ),
    );
  }

  Future<void> showBottomSheet(BuildContext context) async {
    setState(() => isBottomSheetOpen = true);
    // Open bottom sheet to complete details
    await pickLocationDetailsBottomSheet(
      context,
      locationModel: locationDetailsModel!,
    );
    setState(() => isBottomSheetOpen = false);
  }
}
