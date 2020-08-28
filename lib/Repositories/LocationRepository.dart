import 'package:geolocator/geolocator.dart';
import 'package:weather/Models/Location/Location.dart';

class LocationRepo {
  Future<Location> getCurrentLocation() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      throw Exception('Geolocator isn\'t available.\nPlease, turn it on.');
    }
    final Position loc = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
    return Location(loc.latitude.round(), loc.longitude.round());
  }
}
