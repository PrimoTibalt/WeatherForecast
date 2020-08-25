import 'package:geolocator/geolocator.dart';
import 'package:weather/Models/Location/Location.dart';

class LocationRepo {
  Future<Location> getCurrentLocation() async {
    final Position loc = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
    return Location(loc.latitude.round(), loc.longitude.round());
  }
}
