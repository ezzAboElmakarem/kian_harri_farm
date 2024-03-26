import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsShapes {
  Set<Marker> myLocationMarkerSET = {};
  Set<Marker> markers = {};
  Set<Circle> circles = {};
  Set<Polygon> polygons = {};

  void myLocationMarker(LatLng latLng) {
    var myLcationMarker =
        Marker(markerId: const MarkerId('11'), position: latLng);
    myLocationMarkerSET.add(myLcationMarker);
  }

  // void initMarkers() async {
  //   var intialMarkers =  Marker(
  //           infoWindow: InfoWindow(title: placeModel.name),
  //           markerId: MarkerId(
  //             placeModel.id.toString(),
  //           ),
  //           position: placeModel.lating,
  //         ),
  //       ;

  //   markers.add(intialMarkers);
  // }

//
//
//
  void initCircles() {
    var selectedArea = Circle(
      strokeWidth: 2,
      circleId: const CircleId("1"),
      center: const LatLng(31.0363433760613, 31.394044314384814),
      fillColor: Colors.black.withOpacity(0.5),
      radius: 500,
    );
    circles.add(selectedArea);
  }

  void initPolygons() {
    var outOfRangeArea = Polygon(
      strokeWidth: 2,
      holes: const [
        [
          LatLng(31.044665870657532, 31.35103513614788),
          LatLng(31.04375790163822, 31.348096714469378),
          LatLng(31.038433727207458, 31.34920464395471),
        ],
      ],
      polygonId: const PolygonId('1'),
      fillColor: Colors.black.withOpacity(0.5),
      points: const [
        LatLng(31.056272546457656, 31.36251710456107),
        LatLng(31.04962569002436, 31.31144827666335),
        LatLng(31.021048841785905, 31.343872929296822),
      ],
    );
    polygons.add(outOfRangeArea);
  }

// //  List of type MarkerData for Custom Markers
//   List<MarkerData> customMarkerDatalist() {
//     return places
//         .map(
//           (place) => MarkerData(
//             marker: Marker(
//               markerId: MarkerId(place.id.toString()),
//               position: place.lating,
//               infoWindow: InfoWindow(
//                 title: place.name,
//               ),
//             ),
//             child: AppMapMarker(
//               imagePath: "assets/images/new_marker.png",
//               title: place.name,
//             ),
//           ),
//         )
//         .toList();
//   }
}
