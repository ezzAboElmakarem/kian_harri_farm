import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kian_sheeps_projects/core/location_services.dart';
import 'package:kian_sheeps_projects/core/maps_services.dart';

class ReceivingLocation extends StatefulWidget {
  const ReceivingLocation({
    super.key,
  });

  @override
  State<ReceivingLocation> createState() => _ReceivingLocationState();
}

class _ReceivingLocationState extends State<ReceivingLocation> {
  late CameraPosition intialCameraPostion;
  late LocationService locationService;
  late MapsShapes mapsShapes;
  late LatLng selectedLocation;

  @override
  void initState() {
    intialCameraPostion = const CameraPosition(
      target: LatLng(31.040889515779032, 31.377775706637152),
      zoom: 16,
    );
    var intialLLocationLating =
        const LatLng(31.040889515779032, 31.377775706637152);
    mapsShapes = MapsShapes();
    mapsShapes.myLocationMarker(intialLLocationLating);
    locationService = LocationService();

    // mapsShapes.initMarkers();
    selectedLocation = intialCameraPostion.target;

    locationService.getLocation();
    super.initState();
  }

  @override
  void dispose() {
    googleMapController!.dispose();
    super.dispose();
  }

  GoogleMapController? googleMapController;
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomControlsEnabled: false,
      onMapCreated: (controller) {
        googleMapController = controller;
      },
      initialCameraPosition: intialCameraPostion,
      onTap: (clickingLocation) {
        setState(() {
          selectedLocation = clickingLocation;
          log('$selectedLocation');
        });
      },
      markers: {
        Marker(
            markerId: const MarkerId(
              '10',
            ),
            position: selectedLocation)
      },
    );
  }
}
