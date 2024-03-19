import 'package:location/location.dart';

class LocationService {
  Location location = Location();

  /// Check & Enable Location Service

  Future<bool> checkAndRequestLocationService() async {
    var isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        return false;
      }
    }
    return true;
  }

  /// Check & Get Request

  Future<bool> checkAndRequestLocationPermission() async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      return false;
    }
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();

      return permissionStatus == PermissionStatus.granted;
    }
    return true;
  }

  void getRealTimeLocationData(void Function(LocationData)? onData) async {
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();

    location.onLocationChanged.listen(onData);
  }

  Future<LocationData> getLocation() async {
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    var locationData = await location.getLocation();
    return locationData;
  }

  // refactor methods

//*************** Refactor check & Request LocationPermission

  // Future<void> checkAndRequestLocationPermission() async {
  //   var permissionStatus = await location.hasPermission();
  //   if (permissionStatus == PermissionStatus.deniedForever) {
  //     throw LocationPermissionException();
  //   }
  //   if (permissionStatus == PermissionStatus.denied) {
  //     permissionStatus = await location.requestPermission();

  //     if(permissionStatus != PermissionStatus.granted){
  //       throw LocationPermissionException();
  //     }
  //   }
  // }

/////////////   Refactor check & Request LocationService

//  Future<void> checkAndRequestLocationService() async {
//     var isServiceEnabled = await location.serviceEnabled();
//     if (!isServiceEnabled) {
//       isServiceEnabled = await location.requestService();
//       if (!isServiceEnabled) {
//         throw LocationServiceException();
//       }
//     }
//   }
}
