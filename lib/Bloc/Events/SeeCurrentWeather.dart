import 'package:weather/Models/Weather/WeatherModel.dart';

import 'WeatherEvent.dart';

class SeeCurrentWeather extends WeatherEvent {
  final _currentWeather;

  SeeCurrentWeather(this._currentWeather);

  @override
  List<Object> get props => [this._currentWeather];
}
