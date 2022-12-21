import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:inditab_test/controllers/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationServices {
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      var status = await Permission.location.status;

      if (status.isGranted) {
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
      } else if (status.isDenied) {
        Get.showSnackbar(snackBarGoogleError);
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.showSnackbar(snackBarGoogleError);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Get.showSnackbar(snackBarGoogleError);
    }

    //
    return await Geolocator.getCurrentPosition();
  }
}
