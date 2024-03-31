import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../helper/location_services.dart';
import '../../../helper/maps_services.dart';
import '../../../widgets/custom_button.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({
    super.key,
  });

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
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
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: CustomButton(
            buttonText: 'تاكيد العنوان',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlacePicker(
                    apiKey: 'AIzaSyCH4zUtX7UgQU2cBbMVAYLCHQJEQR3vY_M',
                    onPlacePicked: (result) {
                      Navigator.of(context).pop();
                    },
                    initialPosition: selectedLocation,
                    useCurrentLocation: true,
                    resizeToAvoidBottomInset:
                        false, // only works in page mode, less flickery, remove if wrong offsets
                  ),
                ),
              );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const CustomerAddressView(),
              //     settings: RouteSettings(
              //       arguments: selectedLocation.latitude.toString(),
              //     ),
              //   ),
              // );
            }),
      ),
      body: Stack(
        children: [
          GoogleMap(
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
          ),
        ],
      ),
    );
  }
}
