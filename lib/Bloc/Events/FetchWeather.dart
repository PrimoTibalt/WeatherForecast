import 'package:weather/Models/Location/Location.dart';

import 'WeatherEvent.dart';

class FetchWeather extends WeatherEvent {
  final Location _location;

  FetchWeather(this._location);

  @override
  List<Object> get props => [this._location];
}
