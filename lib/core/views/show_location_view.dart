import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/models/location_details_model.dart';
import '../widgets/custom_button.dart';
import 'widgets/location_view_header.dart';
import 'widgets/show_locatioin_bottom_sheet.dart';

class ShowLocationView extends StatefulWidget {
  const ShowLocationView({super.key, required this.locationModel});
  static const String routeName = 'show-location-view';

  final LocationDetailsModel locationModel;

  @override
  State<ShowLocationView> createState() => _ShowLocationViewState();
}

class _ShowLocationViewState extends State<ShowLocationView> {
  Set<Marker> markers = {};
  late LatLng latLng;

  late CameraPosition initialCameraPosition;
  @override
  void initState() {
    super.initState();
    latLng = LatLng(
      widget.locationModel.latitude,
      widget.locationModel.longitude,
    );
    // this position is refer to saved user location , initially
    initialCameraPosition = CameraPosition(target: latLng, zoom: 14);
    initMarker();
    log("Show Location View : ${latLng.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              markers: markers,
              initialCameraPosition: initialCameraPosition,
              mapType: MapType.normal,
              zoomControlsEnabled: false,
            ),
            ShowLocaionViewBody(location: widget.locationModel),
          ],
        ),
      ),
    );
  }

  void initMarker() async {
    markers.add(
      Marker(
        markerId: MarkerId('location'),
        infoWindow: InfoWindow(title: "الموقع"),
        position: latLng,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
    );
    setState(() {});
  }
}

class ShowLocaionViewBody extends StatelessWidget {
  const ShowLocaionViewBody({super.key, required this.location});

  final LocationDetailsModel location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const LocationViewHeader(title: 'عرض الموقع'),
          const Spacer(),
          CustomButton(
            onPressed: () => showLocationDetailsBottomSheet(
              context,
              locationModel: location,
            ),
          ),
        ],
      ),
    );
  }
}
