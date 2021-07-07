import 'package:geolocator/geolocator.dart';

class Location {
  double longtude;
  double latitude;
  Future<void> getTheCurrent() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longtude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
