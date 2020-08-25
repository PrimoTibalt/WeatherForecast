import 'package:weather/Models/Weather/WeatherAdditional.dart';
import 'package:weather/Models/Weather/WeatherGeneral.dart';
import 'package:weather/Models/Weather/WeatherPreciseData.dart';

class WeatherModel {
  final WeatherPreciseData data;

  final WeatherGeneral general;

  final WeatherAdditional additional;

  WeatherModel(this.data, this.general, this.additional);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    WeatherPreciseData newData = WeatherPreciseData.fromJson(json['main']);
    WeatherGeneral newGeneral = WeatherGeneral.fromJson(json['weather'][0]);
    WeatherAdditional newAdditional = WeatherAdditional.fromJson(json);
    return WeatherModel(newData, newGeneral, newAdditional);
  }
}
