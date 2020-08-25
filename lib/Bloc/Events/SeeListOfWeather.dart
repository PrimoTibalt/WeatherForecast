import 'package:weather/Models/Weather/WeatherModel.dart';

import 'WeatherEvent.dart';

class SeeListOfWeather extends WeatherEvent {
  final List<WeatherModel> _listOfWeather;

  SeeListOfWeather(this._listOfWeather);

  @override
  List<Object> get props => [this._listOfWeather];
}
